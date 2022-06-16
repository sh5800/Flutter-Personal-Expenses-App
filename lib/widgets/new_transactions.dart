import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);
  // const NewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // color: Colors.blue.shade50,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (val) => amountInput = val,
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  // print(titleInput);
                  // print(amountInput);
                  // print(titleController.text);
                  // print(amountController.text);
                  // UserTransactions();
                  addTx(titleController.text, double.parse(amountController.text));
                },
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  backgroundColor: Color(0xFFDAEAF1),

                  // shadowColor: Colors.green
                ))
          ],
        ),
      ),
    );
  }
}
