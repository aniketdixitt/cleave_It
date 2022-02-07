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
      body: Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.02, height * 0.02, width * 0.02, height * 0.02),
        color: Colors.brown[900],
        height: height,
        width: width,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
