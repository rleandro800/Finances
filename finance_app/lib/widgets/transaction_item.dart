import 'package:finance_app/models/transaction.dart';
import 'package:flutter/material.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transaction,});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.only(left: 50, top: 8, bottom: 8, right: 50),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadiusDirectional.circular(50),
            color: transaction.isDebt ?  Colors.red[300] :Colors.green[300],),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( width:150, child: Text(transaction.description, style: const TextStyle(fontSize:18, fontWeight:FontWeight.bold, overflow: TextOverflow.ellipsis ))),
                Text("${transaction.value.toStringAsFixed(2)} R\$", style: const TextStyle(fontSize: 18, overflow: TextOverflow.fade),)
              ],
            ),
            /*const Text("", softWrap: false,),*/
          ],
        ),
      ),
    );
  }
}




