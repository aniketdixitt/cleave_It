import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cleave_it/routing.dart' as routing;
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum moneypay { You, Friend }

class _HomeState extends State<Home> {
  String name = "";
  String email = "";
  String password = "";
  String number = "";
  int money = 0;
  String pay = "";
  int nos = 1;
  String cat = "";
  int slf = 0;
  int frnd = 0;
  int food = 0;
  int rent = 0;
  int groc = 0;
  int vehi = 0;
  int others = 0;
  int total = 0;
  final text_mon = TextEditingController();
  final text_decs = TextEditingController();
  var ud;

  moneypay mp = moneypay.You;

  _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[900],
            title: Text(
              'The money was paid by: ',
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w800),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      pay = "You";
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.green[900],
                        backgroundColor: Colors.yellow[700],
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1),
                        elevation: MediaQuery.of(context).size.width * 0.03,
                        shadowColor: Colors.red[900]),
                    child: Text(
                      "You",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pay = "Friend";
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.green[900],
                        backgroundColor: Colors.yellow[700],
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1),
                        elevation: MediaQuery.of(context).size.width * 0.03,
                        shadowColor: Colors.red[900]),
                    child: Text(
                      "Friend",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
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

  int selected = 1;
  _selectpay() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[900],
            title: Text(
              'How many people are involved?',
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w800),
            ),
            content: DropdownButtonFormField(
              value: selected,
              items: [
                DropdownMenuItem(
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: Colors.green[400],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w800),
                  ),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: Colors.green[400],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w800),
                  ),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("4",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text("5",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: 4,
                ),
                DropdownMenuItem(
                  child: Text("6",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: 5,
                ),
              ],
              onSaved: (int? value) {
                selected = value!;
                nos = value + 1;
              },
              onChanged: (int? value) {
                setState(() {
                  selected = value!;
                  nos = value + 1;
                });
              },
            ),
            actions: [
              FlatButton(
                onPressed: () {
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

  String selectcat = "Food";
  _selectCategory() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[900],
            title: Text(
              'The Category of expense was?',
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w800),
            ),
            content: DropdownButtonFormField(
              value: selectcat,
              items: [
                DropdownMenuItem(
                  child: Text(
                    "Food",
                    style: TextStyle(
                        color: Colors.green[400],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w800),
                  ),
                  value: "Food",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Vehicle",
                    style: TextStyle(
                        color: Colors.green[400],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w800),
                  ),
                  value: "Vehicle",
                ),
                DropdownMenuItem(
                  child: Text("Groceries",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: "Groceries",
                ),
                DropdownMenuItem(
                  child: Text("Rent",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: "Rent",
                ),
                DropdownMenuItem(
                  child: Text("Others",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w800)),
                  value: "Others",
                ),
              ],
              onSaved: (String? value) {
                selectcat = value!;
                cat = value;
              },
              onChanged: (String? value) {
                setState(() {
                  selectcat = value!;
                  cat = value;
                });
              },
            ),
            actions: [
              FlatButton(
                onPressed: () {
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
  void initState() {
    super.initState();
    getuser();
  }

  void show(BuildContext context) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03,
                  MediaQuery.of(context).size.height * 0.02,
                  MediaQuery.of(context).size.width * 0.03,
                  MediaQuery.of(context).size.height * 0.02),
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.brown[200]),
              //color: Colors.brown[200],
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    //color: Colors.black12,
                    child: Image(
                      image: AssetImage('images/money.png'),
                      //height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            controller: text_mon,
                            onChanged: (value) {
                              money = int.parse(value);
                            },
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "₹ 0",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: text_decs,
                              onChanged: (value) {},
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.monetization_on),
                                hintText: "What is this expense for?",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "The money was paid by: ",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () {
                            _showDialog();
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.green[900],
                              backgroundColor: Colors.yellow[700],
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1),
                              elevation:
                                  MediaQuery.of(context).size.width * 0.03,
                              shadowColor: Colors.red[900]),
                          child: Row(
                            children: [
                              Text(
                                "Select ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Split Between: ",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.green[900],
                              backgroundColor: Colors.yellow[700],
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1),
                              elevation:
                                  MediaQuery.of(context).size.width * 0.03,
                              shadowColor: Colors.red[900]),
                          onPressed: () {
                            _selectpay();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Add  ",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                              ),
                              Icon(Icons.group_add_sharp),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category of Expense: ",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.green[900],
                              backgroundColor: Colors.yellow[700],
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1),
                              elevation:
                                  MediaQuery.of(context).size.width * 0.03,
                              shadowColor: Colors.red[900]),
                          onPressed: () {
                            _selectCategory();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Select  ",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                              ),
                              Icon(Icons.add_shopping_cart),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.green[900],
                              backgroundColor: Colors.yellow[700],
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1),
                              elevation:
                                  MediaQuery.of(context).size.width * 0.03,
                              shadowColor: Colors.red[900]),
                          onPressed: () {
                            calculation();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Create Expense",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void getuser() async {
    final User? user = await FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    ud = uid.toString();
    //print(ud.toString());
    //print("hi");
    var coll = FirebaseFirestore.instance.collection("Users");
    var querysnap = await coll.get();
    for (var qu in querysnap.docs) {
      //print(qu.data().toString());
      Map<String, dynamic> data = qu.data();
      if (data["ID"] == uid.toString()) {
        name = data["Name"];
        email = data["Email"];
        password = data["Password"];
        number = data["Phone"];
        slf = data["Self"].toInt();
        frnd = data["Friends"].toInt();
        food = data["Food"].toInt();
        rent = data["Rent"].toInt();
        groc = data["Groceries"].toInt();
        vehi = data["Vehicle"].toInt();
        others = data["Others"].toInt();

        total = food + rent + groc + vehi + others;
      }
    }
    setState(() {});
    print(uid.toString());
    print(email);
  }

  void calculation() async {
    var total_split = money / nos;
    int mon = 0;
    if (cat == "Food")
      mon = food;
    else if (cat == "Groceries")
      mon = groc;
    else if (cat == "Vehicle")
      mon = vehi;
    else if (cat == "Rent")
      mon = rent;
    else if (cat == "Others") mon = others;
    getuser();

    print(pay);

    if (pay == "Friend") {
      var splt = frnd + total_split;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(ud)
          .update({"Friends": splt, cat: total_split + mon});
      //print(splt + slf);
      //print(slf);
      //print(splt);
    } else if (pay == "You") {
      var splt = (money - total_split) + slf;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(ud)
          .update({"Self": splt, cat: total_split + mon});
    }

    await FirebaseFirestore.instance.collection(ud).add({
      "Date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "Time": DateFormat("HH:mm:ss").format(DateTime.now()),
      "Day": DateFormat("EEEEE").format(DateTime.now()),
      "Description": text_decs.text,
      "Money": text_mon.text,
      "Paidby": pay,
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SizedBox(
        width: width * 0.35,
        child: FloatingActionButton(
          onPressed: () {
            show(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.03)),
          splashColor: Colors.red[300],
          backgroundColor: Colors.red[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                "Add Expense",
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text('Hello, ' + name),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.02, height * 0.02, width * 0.02, height * 0.02),
          color: Colors.brown[900],
          height: height,
          width: width,
          child: Column(
            children: [
              Card(
                color: Colors.red[900],
                child: Container(
                  //width: width,
                  //height: height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.02, width * 0.02, height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance with Friends:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '₹ ' + (slf - frnd).toString(),
                              style: TextStyle(
                                  color: Colors.green[300],
                                  fontSize: width * 0.1),
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Settle Up",
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ))
                              ],
                            ))
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.black12,
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.02, width * 0.02, height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/man.png'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.green[200],
                      child: Container(
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.01, width * 0.02, height * 0.01),
                        child: Column(
                          children: [
                            Text(
                              "You'll Get",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '₹ ' + slf.toString(),
                              style: TextStyle(
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.green[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.red[200],
                      child: Container(
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.01, width * 0.02, height * 0.01),
                        child: Column(
                          children: [
                            Text(
                              "You'll Pay",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '₹ ' + frnd.toString(),
                              style: TextStyle(
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.red[900]),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  flex: 1,
                  child: Card(
                    color: Colors.brown[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(width * 0.02,
                              height * 0.01, width * 0.02, height * 0.01),
                          width: width,
                          color: Colors.black12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('MMMM').format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '₹ ' + total.toString(),
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green[300]),
                              )
                            ],
                          ),
                        ),
                        //RecentActivities(width: width, height: height),
                        //RecentActivities(width: width, height: height),
                        //RecentActivities(width: width, height: height),
                        Flexible(
                          child: PieChart(
                            dataMap: {
                              "Food": food.toDouble(),
                              "Vehicle": vehi.toDouble(),
                              "Groceries": groc.toDouble(),
                              "Rent": rent.toDouble(),
                              "Others": others.toDouble(),
                            },
                            animationDuration: Duration(milliseconds: 1000),
                            chartLegendSpacing: width * 0.03,
                            chartRadius: width,
                            colorList: [
                              Colors.pink.shade700,
                              Colors.orange.shade800,
                              Colors.indigo.shade500,
                              Colors.green.shade900,
                              Colors.purple.shade400,
                            ],
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            centerText: "Expenses",
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.left,
                              showLegends: true,
                              legendShape: BoxShape.rectangle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 1,
                                chartValueStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

class RecentActivities extends StatelessWidget {
  const RecentActivities({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: Colors.white))),
      padding: EdgeInsets.fromLTRB(
          width * 0.02, height * 0.01, width * 0.02, height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Feb",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[900]),
              ),
              Text("01",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[900]))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Example",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[900]),
              ),
              Text("Paid by : YOU",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[900]))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You lent:",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[900]),
              ),
              Text("₹ 500.00",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[900]))
            ],
          )
        ],
      ),
    );
  }
}
