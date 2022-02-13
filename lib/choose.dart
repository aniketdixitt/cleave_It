import 'dart:ui';

import 'package:cleave_it/routing.dart' as routing;
import 'package:flutter/material.dart';

class ChooseState extends StatefulWidget {
  const ChooseState({Key? key}) : super(key: key);

  @override
  _ChooseStateState createState() => _ChooseStateState();
}

class _ChooseStateState extends State<ChooseState> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e0b00),
      ),
      backgroundColor: Color(0xff1e0b00),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.04, height * 0.03, width * 0.04, height * 0.03),
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage('images/cleave.png'),
              ),
            ),
            Container(
              width: width,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, routing.signupPage);
                },
                style: TextButton.styleFrom(
                    primary: Colors.green[900],
                    backgroundColor: Colors.yellow[700],
                    side: BorderSide(color: Colors.green.shade900, width: 2),
                    elevation: 20),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: width * 0.05),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, routing.loginPage);
                },
                style: TextButton.styleFrom(
                    primary: Colors.green[900],
                    backgroundColor: Colors.yellow[50],
                    side: BorderSide(color: Colors.green.shade900, width: 2),
                    elevation: 20),
                child: Text(
                  "Log in",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: width * 0.05),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.green[900],
                    backgroundColor: Colors.yellow[50],
                    side: BorderSide(color: Colors.green.shade900, width: 2),
                    elevation: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage('images/google.png'),
                    ),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: width * 0.05),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
