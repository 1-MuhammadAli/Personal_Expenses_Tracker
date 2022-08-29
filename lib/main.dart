import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<Transaction> transaction=[
    Transaction(id: 't1',title: 'New Shoes',amount: 69.99,date: DateTime.now(),),
    Transaction(id: 't2',title: 'Weekly Groceries',amount: 16.99,date: DateTime.now(),),
  ];
  // String? titleInput;
  // String? amountInput;
  final titleContoller=TextEditingController();
  final amountController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Flutter App")),
          ),
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART!"),
                ),
              ),
              Card(
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
                      ),
                      FlatButton(onPressed: () {
                        print(titleContoller);
                        print(amountController);
                      }, child: Text("Add Transaction"),
                      textColor: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
              Column(children:
                transaction.map((tx)
                {
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
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text('\$${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                            )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(tx.title,style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),),
                        ],
                        ),
                      ],
                    ),
                  );
                }
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

