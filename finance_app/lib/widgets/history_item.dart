import 'package:flutter/material.dart';


class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.isPayment, required this.value});

  final bool isPayment;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.only(left: 50, top: 8, bottom: 8, right: 50),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadiusDirectional.circular(50),
            color: isPayment ? Colors.green[300] : Colors.red[300],),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Claudete", style: TextStyle(fontSize:18, fontWeight:FontWeight.bold)),
                Text("${value.toStringAsFixed(2)} R\$", style: const TextStyle(fontSize: 18),)
              ],
            ),
            const Text("Description: A very large text in English to show my ability to write wrong", softWrap: false,),
          ],
        ),
      ),
    );
  }
}




