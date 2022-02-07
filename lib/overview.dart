import 'package:cleave_it/routing.dart';
import 'package:cleave_it/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'routing.dart' as routing;
import 'screens/account.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int _currentIndex = 0;
  List screens = [Home(), AccountScreen(), Home(), Home()];
  @override
  _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        backgroundColor: Colors.brown[800],
        unselectedItemColor: Colors.brown[300],
        selectedItemColor: Colors.red[400],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined), label: "Overview"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Friends"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: "Groups"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Account"),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
