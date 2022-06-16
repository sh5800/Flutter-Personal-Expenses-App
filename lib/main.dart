import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
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
      title: 'Personal Expenses App',
      // theme: ThemeData(
      //   primaryColor: Color(0xFF79DAE8)
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  

  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AA1DD),
        centerTitle: true,
        title: Text('Personal Expenses App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // height: 50,
              child: Card(
                color: Colors.blue.shade100,
                child: Text(
                  'CHART !',
                  // textAlign: TextAlign.center,
                ),
                elevation: 5,
              ),
            ),
            // NewTransaction(),
            // TransactionList()
            UserTransactions()
           
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
    );
  }
}
