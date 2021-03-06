import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cleave_it/routing.dart' as routing;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/bill.png'),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: width * 0.02, bottom: height * 0.02),
                    child: Text(
                      "Welcome back to Cleave It!",
                      style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: width * 0.02, bottom: height * 0.02),
              child: Text(
                "Email address",
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              style: TextStyle(color: Colors.green.shade400),
              decoration: InputDecoration(
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
              padding:
                  EdgeInsets.only(top: width * 0.02, bottom: height * 0.02),
              child: Text(
                "Password",
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(color: Colors.green.shade400),
              decoration: InputDecoration(
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
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.only(top: width * 0.02, bottom: height * 0.02),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: width * 0.02),
                        child: TextButton(
                          onPressed: () async {
                            try {
                              final user = FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    routing.overView, (routing) => false);
                                Fluttertoast.showToast(
                                    msg: "Logged in successfully!",
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
                          child: Text("Log in"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: width * 0.02, bottom: height * 0.02),
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              color: Colors.green.shade400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
