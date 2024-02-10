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
  void initState() {
    super.initState();
    transactions = getTransactions(1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Define uma altura fixa para o SizedBox
      child: FutureBuilder<List<Transaction>>(
        future: transactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Verifica se está aguardando os dados
            return const Center(
              child: CircularProgressIndicator(),
            ); // Retorna o CircularProgressIndicator enquanto os dados estão sendo carregados
          } else if (snapshot.hasError) {
            // Verifica se ocorreu um erro
            return Text('${snapshot.error}'); // Retorna um widget Text com a mensagem de erro
          } else if (snapshot.hasData) {
            // Verifica se os dados foram carregados com sucesso
            final List<Transaction> transactions = snapshot.data!; // Acessa os dados do snapshot
            return ListView.builder(
              // Constrói um ListView com os dados das transações
              scrollDirection: Axis.vertical,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionItem(transaction: transaction);
              },
            );
          }
          return const SizedBox(); // Retorna um SizedBox vazio por padrão
        },
      ),
    );
  }
}
