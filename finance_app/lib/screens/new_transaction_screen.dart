import 'package:finance_app/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

class NewTransactionScreen extends StatelessWidget {
  const NewTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("a"),
      ),
        body: const TransactionForm(),
      );
  }
}
