import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return  Container(
     // height: 479,
      height: 300,
      child: transaction.isEmpty ? Column(children: [
        Text("No transactions added yet!",
        //style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          height: 200,
            child: Image.asset('images/waiting.png',fit: BoxFit.cover,)
        ),
      ],):ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                    margin:EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('\$${transaction[index].amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction[index].title,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),),
                  ],
                ),
              ],
            ),
          );
        },
      itemCount: transaction.length,
      ),
    );
  }
}
