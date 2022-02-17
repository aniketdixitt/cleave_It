import 'dart:ui';
import 'package:cleave_it/routing.dart' as routing;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int selected = 1;
  String name = "";
  String email = "";
  String password = "";
  String number = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e0b00),
      ),
      backgroundColor: Colors.brown[900],
      body: Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.02, height * 0.02, width * 0.02, height * 0.02),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: height * 0.02),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.4,
                    child: Image(
                      image: AssetImage('images/introduction.png'),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              onChanged: (value) {
                name = value;
              },
              style: TextStyle(color: Colors.green.shade400),
              decoration: InputDecoration(
                label: Text("Full name"),
                labelStyle: TextStyle(
                    color: Colors.yellow.shade900, fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Colors.yellow.shade800),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade400, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: width * 0.3,
                        child: Image(
                          image: AssetImage('images/signuser.png'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              style: TextStyle(color: Colors.green.shade400),
                              decoration: InputDecoration(
                                label: Text("Your email address"),
                                labelStyle: TextStyle(
                                    color: Colors.yellow.shade900,
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade800),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green.shade400, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextField(
                              onChanged: (value) {
                                password = value;
                              },
                              style: TextStyle(color: Colors.green.shade400),
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text("Your password"),
                                labelStyle: TextStyle(
                                    color: Colors.yellow.shade900,
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade800),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green.shade400, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Row(
                children: [
                  DropdownButton(
                    value: selected,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "+91",
                          style: TextStyle(color: Colors.green.shade400),
                        ),
                        value: 1,
                      )
                    ],
                    onChanged: (Object? value) {},
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: TextField(
                          onChanged: (value) {
                            number = value;
                          },
                          style: TextStyle(color: Colors.green.shade400),
                          decoration: InputDecoration(
                            label: Text("Phone number"),
                            labelStyle: TextStyle(
                                color: Colors.yellow.shade900,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.yellow.shade800),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green.shade400, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: width * 0.04),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () async {
                        try {
                          final newUser = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            final User? user =
                                FirebaseAuth.instance.currentUser;
                            final uid = user?.uid;
                            var data = await FirebaseFirestore.instance
                                .collection("Users")
                                .doc(uid.toString())
                                .set({
                              "Name": name,
                              "Email": email,
                              "Password": password,
                              "Phone": number,
                              "ID": uid.toString(),
                              "Self": 0,
                              "Friends": 0,
                              "Food": 0,
                              "Rent": 0,
                              "Groceries": 0,
                              "Vehicle": 0,
                              "Others": 0
                            });
                            Navigator.pushNamedAndRemoveUntil(
                                context, routing.loginPage, (routing) => false);
                            Fluttertoast.showToast(
                                msg: "Account created successfully!",
                                toastLength: Toast.LENGTH_LONG);
                          }
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: e.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                        }
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.green[900],
                          backgroundColor: Colors.yellow[700],
                          side: BorderSide(
                              color: Colors.green.shade900, width: 1),
                          elevation: width * 0.03,
                          shadowColor: Colors.white),
                      child: Text("Done"),
                    ),
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.only(
                        top: width * 0.04, bottom: height * 0.02),
                    child: Text(
                      "By signing up, you accept the Cleave It Terms and Services.",
                      style: TextStyle(
                          fontSize: width * 0.04, color: Colors.green.shade400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
