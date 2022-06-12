import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // const NewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // color: Colors.blue.shade50,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                  print(titleController.text);
                  print(amountController.text);
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
