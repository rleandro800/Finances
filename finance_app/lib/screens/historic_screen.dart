import 'package:finance_app/models/user.dart';
import 'package:finance_app/services/transaction_api.dart';
import 'package:finance_app/widgets/transaction_item.dart';
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
  double _balance = 15.50;
  late Future<User> users;
  late Future<List<Transaction>> transactions;

  void addToBalance(double value) {
    setState(() {
      _balance += value;
    });
  }

  void subtractFromBalance(double value) {
    setState(() {
      _balance -= value;
    });
  }

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
                  return Text(snapshot.data!.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 300, // Define uma altura fixa para o SizedBox
              child: FutureBuilder<List<Transaction>>(
                future: transactions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Verifica se está aguardando os dados
                    return CircularProgressIndicator(); // Retorna o CircularProgressIndicator enquanto os dados estão sendo carregados
                  } else if (snapshot.hasError) {
                    // Verifica se ocorreu um erro
                    return Text(
                        '${snapshot.error}'); // Retorna um widget Text com a mensagem de erro
                  } else if (snapshot.hasData) {
                    // Verifica se os dados foram carregados com sucesso
                    final List<Transaction> transactions =
                        snapshot.data!; // Acessa os dados do snapshot
                    return ListView.builder(
                      // Constrói um ListView com os dados das transações
                      scrollDirection: Axis.vertical,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        print(transaction);
                        return TransactionItem(transaction: transaction);
                      },
                    );
                  }
                  return SizedBox(); // Retorna um SizedBox vazio por padrão
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
