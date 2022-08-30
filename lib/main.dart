import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/widgets/new_transaction.dart';
import 'package:personal_expenses_tracker/widgets/transaction_list.dart';
//import 'package:personal_expenses_tracker/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // String? titleInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction =[
    Transaction(id: 't1',title: 'New Shoes',amount: 69.99,date: DateTime.now(),),
    Transaction(id: 't2',title: 'Weekly Groceries',amount: 16.99,date: DateTime.now(),),
  ];
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx=Transaction(title: txTitle,amount: txAmount,date: DateTime.now(),id:DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {

        },
        child:NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          actions: [
            IconButton(
              onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
             TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:() => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}

