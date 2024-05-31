import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kudosware_assignment/addData.dart';
import 'package:kudosware_assignment/readData.dart';

const boxkadecoration1 = InputDecoration(
  hintText: 'Enter your ',
  hintStyle: TextStyle(
      color: Colors.grey
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class buttonwork extends StatelessWidget {
  buttonwork({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.05,
        width: MediaQuery.of(context).size.width*0.85,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class signoutbox extends StatelessWidget {
  const signoutbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ),
            Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


BottomAppBar buildBottomAppBar1(BuildContext context) {
  return BottomAppBar(
    color: Colors.pink,
    height: MediaQuery.of(context).size.height*.06,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> addData()));
          },
          child: Icon(
            Icons.cloud_upload,
            color: Colors.white,
            size: 35,
          ),
        ),
        Flexible(
          child: VerticalDivider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => readData()));
          },
          child: Icon(
            Icons.menu_book,
            color: Colors.white70,
            size: 26,
          ),
        ),
      ],
    ),
  );
}

BoxDecoration containerdecoration() {
  return BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(32)
  );
}

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.pink,
          ]
      )
  );
}
BottomAppBar bottombar2(BuildContext context) {
  return BottomAppBar(
    color: Colors.pink,
    height: MediaQuery.of(context).size.height*.06,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> addData()));
          },
          child: Icon(
            Icons.cloud_upload,
            color: Colors.white70,
            size: 26,
          ),
        ),
        Flexible(
          child: VerticalDivider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => readData()));
          },
          child: Icon(
            Icons.menu_book,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    ),
  );
}

class studentdata extends StatelessWidget {
  studentdata({required this.name, required this.dob, required this.gender});
  String name, dob, gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            color: Colors.purple.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width*.9,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flexible(
                      child: Text(
                        'Name: $name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.redAccent,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Flexible(
                      child: Text(
                        'Date of birth: $dob',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: Flexible(
                      child: Text(
                        'Gender: $gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
