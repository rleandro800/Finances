

import 'package:finance_app/models/user.dart';
import 'package:finance_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/services/user_api.dart';

import '../models/transaction.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("a"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<User>(
                future: getUser(1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      var user = snapshot.data!;
                      var formattedAmount =
                          user.amount.toStringAsFixed(2).replaceAll('.', ',');
                      return Container(
                        margin: const EdgeInsets.all(25),
                        alignment: Alignment.center,
                        child: Text("$formattedAmount R\$",
                            style: const TextStyle(fontSize: 60)),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const SizedBox();
                }),
            const TransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.pushNamed(context, '/b');
        },
      ),
    );
  }
}
