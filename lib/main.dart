import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses App',
      // theme: ThemeData(
      //   primaryColor: Color(0xFF79DAE8)
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 'Item 1',
      title: 'Ghost Backpack',
      amount: 3400,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Item 2',
      title: 'Grocery',
      amount: 3400,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AA1DD),
        centerTitle: true,
        title: Text('Personal Expenses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: Card(
              color: Colors.blue.shade100,
              child: Text(
                'CHART !',
                textAlign: TextAlign.center,
              ),
              elevation: 5,
            ),
          ),
          Container(
            // width: double.infinity,
            // height: 50,
            child: Card(
              color: Colors.red.shade100,
              child: Text(
                'LIST of TRX',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Container(
                  color: Color(0xFFDFF6FF),
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blue.shade800, width: 2),
                              // color: Colors.purple
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple
                            ),
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              // color:Colors.grey
                            ),
                            ),
                          Text(
                            tx.date.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color:Colors.grey
                            )
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
