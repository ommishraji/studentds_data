import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kudosware_assignment/addData.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'const.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool spin = false;
  late String email;
  late String password;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Container(
          decoration: buildBoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Teacher',
                    style: TextStyle(
                        color: Colors.yellow.shade300,
                        fontStyle: FontStyle.italic,
                        fontSize: 50
                    ),
                  ),
                  Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Icon(
                          Icons.lightbulb,
                          size: MediaQuery.of(context).size.height*.2,
                          color: Colors.yellow.shade300,
                        ),
                      ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Container(
                  decoration: containerdecoration(),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: boxkadecoration1.copyWith(hintText: 'Enter your email'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: containerdecoration(),
                  child: TextField(
                    controller: controller2,
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: boxkadecoration1.copyWith(hintText: 'Enter your password')
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: GestureDetector(
                    onTap: () async {
                      //get user login
                      setState(() {
                        spin = true;
                      });
                      try {
                        final userdata = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: email, password: password);
                        if(userdata!= null){
                          setState(() {
                            spin = false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => addData()));
                        }
                      }
                      catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$e'))
                        );
                        setState(() {
                          spin = false;
                        });
                      }
                      controller.clear();
                      controller2.clear();
                    },
                    child: buttonwork(text: 'Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
