import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cleave_it/routing.dart' as routing;

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
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
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: height * 0.001, color: Colors.black))),
                padding: EdgeInsets.fromLTRB(
                    width * 0.01, height * 0.01, width * 0.01, height * 0.025),
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
                    Container(
                      child: Icon(Icons.edit_outlined),
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
                              child: Icon(Icons.email_outlined),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: width * 0.07),
                              child: Text("Email Setting",
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w400)),
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
                        Container(
                          padding: EdgeInsets.only(left: width * 0.07),
                          child: Text("App Settings",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400)),
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
                        Container(
                          padding: EdgeInsets.only(left: width * 0.07),
                          child: Text("Rate Us",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400)),
                        )
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
                        Container(
                          padding: EdgeInsets.only(left: width * 0.07),
                          child: Text("About Us",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
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
                            fontWeight: FontWeight.w400,
                            color: Colors.red[600])),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
