import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'login_page.dart';

class addData extends StatefulWidget {
  const addData({super.key});


  @override
  State<addData> createState() => _addDataState();
}

class _addDataState extends State<addData> {
  String? name, gender;
  String dob = 'Enter DOB';
  List<String> itemlist = ['Male', 'Female', 'Other'];
  Color c1 = Colors.grey;
  TextEditingController controller1 = TextEditingController();

  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> login_page()),
          (Route<dynamic> route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    signout();
                  },
                  child: const signoutbox(),
                )
              ],
            )
        ),

        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.purple
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: containerdecoration(),
                  child: TextField(
                    controller: controller1,
                    onChanged: (value) {
                      name = value;
                    },
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: boxkadecoration1.copyWith(
                        hintText: 'Enter Student name',
                        prefixIcon: const Icon(Icons.person)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: containerdecoration(),
                  child: TextField(
                    onTap: () async {
                      DateTime? datepick = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (datepick != null) {
                        setState(() {
                          dob = '${datepick.day.toString()}-${datepick.month
                              .toString()}-${datepick.year.toString()}';
                          c1 = Colors.black;
                        });
                      }
                    },
                    readOnly: true,
                    decoration: boxkadecoration1.copyWith(hintText: (dob),
                      prefixIcon: const Icon(Icons.calendar_month),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 1,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton<String>(
                      value: gender,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.man,
                            color: Colors.grey,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .75,
                            child: Text(
                              "Select Gender",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      items: itemlist.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async {
                      if (name != null && gender != null &&
                          dob != 'Enter DOB') {
                        FirebaseFirestore cloud = await FirebaseFirestore
                            .instance;
                        cloud.collection('studentsData').add({
                          'Name': name,
                          'DOB': dob,
                          'Gender': gender,
                        }
                        );
                        controller1.clear();
                        setState(() {
                          gender = null;
                          dob = 'Enter DOB';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uploaded Succesfully')));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter proper details')));
                      }
                    },

                    child: buttonwork(text: 'Upload')
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomAppBar1(context)


    );
  }


}
