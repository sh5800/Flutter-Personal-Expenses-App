import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:personal_expenses_app/widgets/user_transactions.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;
  final Function deleteTx;
  TransactionList({this.transactions,  required this.deleteTx});
  // const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions!.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 27.5,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('Rs ${transactions![index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions![index].title.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactions![index].date as DateTime)),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transactions![index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transactions!.length,
              // children: transactions!.map((tx) {
            ),
    );
  }
}
