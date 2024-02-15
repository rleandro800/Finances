

import 'package:finance_app/models/transaction.dart';
import 'package:finance_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../services/transaction_api.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late Future<List<Transaction>> transactions;

  @override
  void initState(){
    transactions = getTransactions(1);
    super.initState();
  }

 void reloadList() async{
   await Future.delayed(const Duration(seconds: 1));
    setState(() {
      transactions = getTransactions(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: FutureBuilder<List<Transaction>>(
            future: transactions,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text(
                    '${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<Transaction> transactions =
                snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return TransactionItem(transaction: transaction);
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            Transaction newTransaction = const Transaction(id: null, isDebt: false, description: "payment", userId: 1, value: 2500.00, createAt: '2024-02-12');
            postTransactions(newTransaction);
            reloadList();
          },
        )
      ],
    );
  }
}
