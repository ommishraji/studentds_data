import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kudosware_assignment/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'const.dart';
import 'package:firebase_auth/firebase_auth.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool spin = false;
  late String email;
  late String password;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  Future<void> _register() async{
    try {
      UserCredential? newuser;
      newuser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = newuser.user!;
      await user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification email sent to ${user.email}. Please verify your email')),
      );
      await  Future.delayed(Duration(seconds: 1));
      _showpopup();
      //Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register: $e')),
      );
      spin = false;
      controller.clear();
      controller2.clear();
    }
  }

  void _showpopup(){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
            },
              child: Expanded(child: buttonwork(text: 'Back to login page'))),
        ],
      );
        }
    );
  }

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
                        //Do something with the user input.
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
                      _register();
                      controller.clear();
                      controller2.clear();

                    },
                    child: buttonwork(text: 'SignUp')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
