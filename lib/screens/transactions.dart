import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

enum moneypay { You, Friend }

class _TransactionsState extends State<Transactions> {
  String date = "";
  String time = "";
  String day = "";
  String pay = "";
  String amt = "";
  String descri = "";
  String name = "";
  String email = "";
  String password = "";
  String number = "";
  int money = 0;
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
  String ud = " ";

  @override
  void initState() {
    super.initState();
    getuser();
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
    print(date);
    print(day);
    print(descri);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text("Transactions"),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            SizedBox(
              height: height * 0.005,
            ),
            /*TransactionCard(
              width: width,
              height: height,
              date: date,
              day: day,
              time: time,
              pay: pay,
              amount: amt,
              descri: descri,
            ),*/
            TransactionList(
                width: width,
                height: height,
                date: date,
                day: day,
                time: time,
                pay: pay,
                amount: amt,
                descri: descri,
                ud: ud)
          ],
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final width;
  final height;
  final date;
  final day;
  final time;
  final pay;
  final amount;
  final descri;
  final ud;
  const TransactionList(
      {Key? key,
      required this.width,
      required this.height,
      required this.date,
      required this.day,
      required this.time,
      required this.pay,
      required this.amount,
      required this.descri,
      required this.ud})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection(ud).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;
              List<Widget> children = [];
              for (var docs in documents!) {
                print("hi");
                children.add(TransactionCard(
                    width: width,
                    height: height,
                    date: docs["Date"],
                    day: docs["Day"],
                    time: docs["Time"],
                    pay: docs["Paidby"],
                    amount: docs["Money"],
                    descri: docs["Description"]));
              }
              return ListView(
                children: children,
              );
            } else if (snapshot.hasError) {
              return Text("Something is wrong!");
            } else {
              return SizedBox(
                child: CircularProgressIndicator(),
                height: height * 0.1,
                width: width * 0.1,
              );
            }
          }),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.date,
      required this.day,
      required this.time,
      required this.pay,
      required this.amount,
      required this.descri})
      : super(key: key);

  final double width;
  final double height;
  final String date;
  final String day;
  final String time;
  final String pay;
  final String amount;
  final String descri;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.brown[200],
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2, color: Colors.brown.shade900),
              )),
              padding: EdgeInsets.only(
                left: width * 0.02,
                right: width * 0.02,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(descri,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.05))
                      ],
                    ),
                    padding: EdgeInsets.only(top: width * 0.02, bottom: 0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.15,
                        width: width * 0.15,
                        child: Image(
                          image: AssetImage('images/man.png'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paid by:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.04)),
                          Text(pay,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.04,
                                  color: Colors.green[900])),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                  color: Colors.blue[900])),
                          Text(day,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                  color: Colors.purple[900])),
                          Text(time,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                  color: Colors.pink[700])),
                        ],
                      ),
                      Text('₹ ' + amount,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.05,
                              color: Colors.red[900]))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
