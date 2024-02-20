import 'package:finance_app/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

class NewTransactionScreen extends StatelessWidget {
  String title;
  bool isDebt;
  NewTransactionScreen( {super.key, required this.title, required this.isDebt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("a"),
      ),
        body: TransactionForm( title: title, isDebt: isDebt),
      );
  }
}
