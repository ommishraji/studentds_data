import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kudosware_assignment/const.dart';
import 'package:kudosware_assignment/login_page.dart';
import 'package:kudosware_assignment/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkemailverification();
  }
  User? user = FirebaseAuth.instance.currentUser;
  Future _checkemailverification() async{

    final user = this.user;
    if(user != null){
      await user.reload();
    }
    if(user!.emailVerified){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email verified'))
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email not verified, please verify your Email to login'))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        decoration: buildBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Icon(
                        Icons.lightbulb,
                        size: MediaQuery.of(context).size.height*.2,
                        color: Colors.yellow.shade300,
                      ),
                    )
                ),
                Text(
                  'Teacher',
                  style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontStyle: FontStyle.italic,
                      fontSize: 50
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
                  },
                  child: buttonwork(text: 'Login')),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                },
                child: buttonwork(text: 'SignUp')),

          ],
        ),
      ),

    );
  }


}
