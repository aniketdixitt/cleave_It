import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cleave_it/routing.dart' as routing;
import 'package:fluttertoast/fluttertoast.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var ud;
  final name = TextEditingController();

  void getuser() async {
    final User? user = await FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    ud = uid.toString();
    //print(ud.toString());
    //print("hi");
    setState(() {});
  }

  _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[900],
            title: Text(
              'Enter new user name: ',
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w800),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: TextField(
                controller: name,
                onChanged: (value) {},
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("Users")
                      .doc(ud)
                      .update({"Name": name.toString()});
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.green[300]),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text("Profile"),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.02, height * 0.02, width * 0.02, height * 0.02),
          color: Colors.brown[900],
          height: height,
          width: width,
          child: Container(
            color: Colors.brown[200],
            padding: EdgeInsets.fromLTRB(
                width * 0.03, height * 0.02, width * 0.03, height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACCOUNT",
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: height * 0.001, color: Colors.black))),
                  padding: EdgeInsets.fromLTRB(width * 0.01, height * 0.01,
                      width * 0.01, height * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: width * 0.17,
                          child: Image.asset('images/man.png')),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aniket Dixit",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600)),
                          Text("daniket681@gmail.com",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          _showDialog();
                          setState(() {});
                        },
                        child: Container(
                          child: Icon(Icons.edit_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: height * 0.02),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: height * 0.001, color: Colors.black))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Prefrences",
                          style: TextStyle(
                              fontSize: width * 0.037,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: width * 0.07),
                                child: Text("Email Setting",
                                    style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.settings),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: width * 0.07),
                              child: Text("App Settings",
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w600)),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text("Feedback",
                          style: TextStyle(
                              fontSize: width * 0.037,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.star),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: width * 0.07),
                              child: Text("Rate Us",
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w600)),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.info_outline),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: width * 0.07),
                              child: Text("About Us",
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w600)),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.login_outlined,
                          color: Colors.red[600],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: width * 0.07),
                        child: Text("Log Out",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colors.red[600])),
                      )
                    ],
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    setState(() {});
                    Navigator.pushNamedAndRemoveUntil(
                        context, routing.choosePage, (route) => false);
                    Fluttertoast.showToast(
                        msg: "Logged Out!", toastLength: Toast.LENGTH_LONG);
                  },
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(
                              "Terms",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.04,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                          Text(
                            "???",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            child: Text(
                              "Privacy",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.04,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                          Text(
                            "???",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "v 3.0.0",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.04,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
