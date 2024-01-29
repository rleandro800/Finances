import 'package:flutter/material.dart';
import './history_item.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<HistoryItem> data = [
    HistoryItem(isPayment: true, value: 250.50),
    HistoryItem(isPayment: true, value: 850.50),
    HistoryItem(isPayment: true, value: 150.50),
    HistoryItem(isPayment: false, value: 320.50),
    HistoryItem(isPayment: true, value: 400.50),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: data,
      ) ,
    );
  }
}
