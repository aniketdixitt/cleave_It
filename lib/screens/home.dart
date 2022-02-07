import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cleave_it/routing.dart' as routing;
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SizedBox(
        width: width * 0.3,
        child: FloatingActionButton(
          onPressed: () {},
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
                              "₹ XX",
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
                              "₹ XX",
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
                              "₹ XX",
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
                                "February",
                                style: TextStyle(
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "₹ 0",
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
                              "Food": 5,
                              "Vehicle": 3,
                              "Groceries": 4,
                              "Rent": 2,
                              "Others": 2,
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
