import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transactions.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  // const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(
          transactions: _userTransactions,
        )
      ],
    );
  }
}
