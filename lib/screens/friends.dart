import 'dart:ui';

import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  void show(BuildContext context) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
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
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
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
                            textAlign: TextAlign.center,
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
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            primary: Colors.green[900],
                            backgroundColor: Colors.yellow[700],
                            side: BorderSide(
                                color: Colors.green.shade900, width: 1),
                            elevation: MediaQuery.of(context).size.width * 0.03,
                            shadowColor: Colors.red[900]),
                        child: Row(
                          children: [
                            Text(
                              "Select ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
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
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.green[900],
                            backgroundColor: Colors.yellow[700],
                            side: BorderSide(
                                color: Colors.green.shade900, width: 1),
                            elevation: MediaQuery.of(context).size.width * 0.03,
                            shadowColor: Colors.red[900]),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Add  ",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            Icon(Icons.group_add_sharp),
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
                            elevation: MediaQuery.of(context).size.width * 0.03,
                            shadowColor: Colors.red[900]),
                        onPressed: () {},
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

                /*Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red[300],
                  ),
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.01,
                      MediaQuery.of(context).size.height * 0.01,
                      MediaQuery.of(context).size.width * 0.01,
                      MediaQuery.of(context).size.height * 0.01),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset('images/people.png'),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.09,
                      ),
                      Expanded(
                        child: Text(
                          "Splitting with...",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )*/
              ],
            ),
          );
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
        title: Text("Friends"),
      ),
      body: Container(
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
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.02,
                          width * 0.02, height * 0.02),
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
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.02,
                          width * 0.02, height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            color: Colors.green[200],
                            child: Container(
                              padding: EdgeInsets.fromLTRB(width * 0.02,
                                  height * 0.01, width * 0.02, height * 0.01),
                              child: Row(
                                children: [
                                  Text(
                                    "You'll Get ",
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
                          Card(
                            color: Colors.red[200],
                            child: Container(
                              padding: EdgeInsets.fromLTRB(width * 0.02,
                                  height * 0.01, width * 0.02, height * 0.01),
                              child: Row(
                                children: [
                                  Text(
                                    "You'll Pay ",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      color: Colors.brown[200],
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      width: width * 0.4,
                      height: height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Icon(Icons.person_add_alt_1_sharp),
                          ),
                          Text(
                            "Add Friends",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                    color: Colors.brown[200],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Sahaj",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 5000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Ashu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 4000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Sahaj",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 150",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Param",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 3000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Param",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 3000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2, color: Colors.brown.shade900),
                          )),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * 0.15,
                                    width: width * 0.15,
                                    child: Image(
                                      image: AssetImage('images/man.png'),
                                    ),
                                  ),
                                  Text(
                                    "Param",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.05),
                                  ),
                                  Text("₹ 3000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
