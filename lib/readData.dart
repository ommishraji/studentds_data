import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kudosware_assignment/addData.dart';
import 'package:kudosware_assignment/login_page.dart';

import 'const.dart';

class readData extends StatefulWidget {
  const readData({super.key});
  @override
  State<readData> createState() => _readDataState();
}

class _readDataState extends State<readData> {
  void signout() async {
    FirebaseAuth.instance.signOut();
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
        decoration: buildBoxDecoration(),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('studentsData').snapshots(),
          builder: (context, snapsort){
            if(snapsort.hasData){
              final data = snapsort.data!.docs;
              List<studentdata> datalist = [];
              for(var datas in data){
                  final name = datas['Name'];
                  final dob = datas['DOB'];
                  final gender = datas['Gender'];
                  datalist.add(studentdata(
                      name: name,
                      dob: dob,
                      gender: gender,
                  ));

              }
              return ListView(
                children: datalist,
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
            }

          },
        ),
      ),

      bottomNavigationBar: bottombar2(context),

    );
  }
}

