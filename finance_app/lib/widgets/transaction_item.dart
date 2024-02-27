import 'package:finance_app/models/transaction.dart';
import 'package:finance_app/services/transaction_api.dart';
import 'package:flutter/material.dart';


class TransactionItem extends StatefulWidget {
  const TransactionItem({super.key, required this.transaction,});

  final Transaction transaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.only(left: 50, top: 8, bottom: 8, right: 50),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadiusDirectional.circular(50),
            color: defineColor(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( width:150, child: Text(widget.transaction.description, style: const TextStyle(fontSize:18, fontWeight:FontWeight.bold, overflow: TextOverflow.ellipsis ))),
                Text("${widget.transaction.value.toStringAsFixed(2)} R\$", style: const TextStyle(fontSize: 18, overflow: TextOverflow.fade),),
                GestureDetector(
                  child: const Icon(Icons.delete, color: Colors.black, size: 20,),
                  onTap: () {
                    if(!isClicked){
                      TransactionApi.deleteTransaction(widget.transaction.id!);
                      setState(() {
                        isClicked = true;
                      });
                    }
                  },
                )
              ],
            ),
            /*const Text("", softWrap: false,),*/
          ],
        ),
      ),
    );
  }

  Color? defineColor(){
    if(isClicked){
      return Colors.white24;
    } else {
      return widget.transaction.isDebt ?  Colors.red[300] : Colors.green[300];
    }
  }
}




