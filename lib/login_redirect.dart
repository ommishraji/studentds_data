import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kudosware_assignment/login.dart';

import 'const.dart';

class login_redirect extends StatefulWidget {
  const login_redirect({super.key});

  @override
  State<login_redirect> createState() => _login_redirectState();
}

class _login_redirectState extends State<login_redirect> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('ye dekho');
        controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    controller.forward();
controller.addListener(() {
  setState(() {

  });
print(controller.value);
});
  }
//   void initstate(){
//     super.initState();
//

//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey.shade100,
      body: Container(
        decoration: buildBoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.yellow.shade300,
                    size: controller.value*300,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                },
                  child: buttonwork(text: 'login/SignUp for Teachers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


