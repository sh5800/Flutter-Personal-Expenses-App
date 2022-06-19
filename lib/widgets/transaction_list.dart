import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:personal_expenses_app/widgets/user_transactions.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;

  TransactionList({this.transactions});
  // const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
     
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Container(
                color: Color(0xFFDFF6FF),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration
                      (
                        border: Border.all(
                          color: Theme.of(context).primaryColor, 
                          width: 2
                        ),
                        // color: Colors.purple
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Rs ${transactions![index].amount!.toStringAsFixed(2)} /-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions![index].title.toString(),
                          style: Theme.of(context).textTheme.titleMedium
                        ),
                        Text(
                            DateFormat('dd-MMMM-yyyy  kk:mm')
                                .format(DateTime.now()),
                            // tx.date.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          ,
          itemCount: transactions!.length,
          // children: transactions!.map((tx) {
           
        ),
    );
  }
}
