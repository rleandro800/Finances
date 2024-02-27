

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../services/transaction_api.dart';

class TransactionForm extends StatefulWidget {
  String title;
  bool isDebt;
  TransactionForm({super.key, required this.title, required this.isDebt});

  @override
  State<TransactionForm> createState() => _TransactionFormState(title, isDebt);
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController value = TextEditingController();
  TextEditingController description = TextEditingController();
  String title;
  bool isDebt;
  _TransactionFormState(this.title, this.isDebt);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Colors.black12,

        ),
        width: 380,
        height: 665,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
            style: const TextStyle(
              fontSize: 20
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: value,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Valor'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: description,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descrição'
                ),
              ),
            ),
            ElevatedButton(onPressed:(){
              if( description != null && value != null){
                Transaction newTransaction = Transaction(isDebt: isDebt, description: description.text, userId: 1, value: double.parse(value.text));
                TransactionApi.postTransactions(newTransaction);
                //reloadList();
              }
              print(double.parse(value.text));
              print(description.text);
            }, child: const Text('Avançar'))
          ],
        ),
      ),
    );
  }
}