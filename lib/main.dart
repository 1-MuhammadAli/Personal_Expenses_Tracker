import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/widgets/chart.dart';
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
      //title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          )
      //     appBarTheme: AppBarTheme(
      //       textTheme: ThemeData.light().textTheme.copyWith(
      //         headline6: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'OpenSans',
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      // ),
      ),
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
    // Transaction(id: 't1',title: 'New Shoes',amount: 69.99,date: DateTime.now(),),
    // Transaction(id: 't2',title: 'Weekly Groceries',amount: 16.99,date: DateTime.now(),),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransaction.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
            Duration(days: 7),
        ),
      );

    }).toList();
  }

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
          title: Text("Personal Expenses",
            //style: Theme.of(context).textTheme.headline6,
          ),
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
             Chart(_recentTransactions),
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

