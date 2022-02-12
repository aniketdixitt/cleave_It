import 'dart:async';

import 'package:cleave_it/screens/friends.dart';
import 'package:cleave_it/screens/home.dart';
import 'package:flutter/material.dart';
import 'choose.dart';
import 'login.dart';
import 'overview.dart';
import 'routing.dart';
import 'screens/account.dart';
import 'screens/groups.dart';
import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //initialRoute: overView,
        routes: {
          homeScreen: (context) {
            return const Home();
          },
          overView: (context) {
            return const Overview();
          },
          accountScreen: (context) {
            return const AccountScreen();
          },
          friendScreen: (context) {
            return const Friends();
          },
          groupScreen: (context) {
            return const Groups();
          },
          loginPage: (context) {
            return const LoginPage();
          },
          signupPage: (context) {
            return const SignupPage();
          },
          choosePage: (context) {
            return const ChooseState();
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, choosePage));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xff1e0b00),
      child: Image(
        image: AssetImage('images/CLEAVE.png'),
      ),
    );
  }
}
