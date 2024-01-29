import 'package:finance_app/widgets//history_item.dart';
import 'package:finance_app/widgets/history_list.dart';
import 'package:flutter/material.dart';
import '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _balance = 15.50;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${_balance.toStringAsFixed(2).replaceAll('.', ',')}R\$",
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            const HistoryList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToBalance(0);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
