import 'dart:ui';

import 'package:flutter/material.dart';
import './widgets/chart.dart';
// import './widgets/user_transactions.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
// import './widgets/new_transactions.dart';
// import './widgets/transaction_list.dart';
// import 'package:intl/intl.dart';
// import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Color(0xFF0AA1DD),
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontFamily: 'Ubuntu',
                  // fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),

      // theme: ThemeData(
      //   primaryColor: Color(0xFF79DAE8)
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? titleInput;
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'Item 1',
    //   title: 'Ghost Backpack',
    //   amount: 3400,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'Item 2',
    //   title: 'Grocery',
    //   amount: 3400,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction>? get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF92B4EC),
        centerTitle: true,
        title: Text(
          'Personal Expenses',
        ),

        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
            color: Color(0xFFF94C66),
            // highlightColor: Color(0xFF92B4EC),
            // focusColor: Color(0xFF92B4EC),
            hoverColor: Color(0xFF0AA1DD),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chart(_recentTransactions!),
            // NewTransaction(),
            TransactionList(
               transactions:_userTransactions,
              deleteTx:_deleteTransaction
            )
            // UserTransactions()

            // Container(
            //   // width: double.infinity,
            //   height: 50,
            //   child: Card(
            //     color: Colors.red.shade100,
            //     child: Text(
            //       'LIST of TRX',
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
