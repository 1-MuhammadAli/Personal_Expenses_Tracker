import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/widgets/transaction_list.dart';
class NewTransaction extends StatelessWidget {
   final Function addTx;
  final titleContoller=TextEditingController();
  final amountController=TextEditingController();
  NewTransaction(this.addTx);

  void submitData(){
    final enteredTitle=titleContoller.text;
    final enteredAmount=double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
    addTx(titleContoller.text,double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleContoller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
                onPressed: submitData,
            child: Text("Add Transaction"),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
