import 'package:finance_app/models/user.dart';
import 'package:finance_app/services/transaction_api.dart';

import 'package:finance_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/services/user_api.dart';

import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<User> users;
  late Future<List<Transaction>> transactions;

  @override
  didChangeDependencies() {
    users = getUser(1);
    transactions = getTransactions(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              FutureBuilder<User>(
                  future: users,
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
              const TransactionList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            "TODO";
          },
        ));
  }
}
