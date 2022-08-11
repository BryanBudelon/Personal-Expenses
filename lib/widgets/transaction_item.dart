import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    this.transaction,
    this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('dd/MM/yy - H:m').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),

        // return Card(
        //     child: Row(
        //   children: [
        //     Container(
        //       margin: EdgeInsets.symmetric(
        //         vertical: 10,
        //         horizontal: 15,
        //       ),
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //         color: Theme.of(context).primaryColorDark,
        //         width: 2,
        //       )),
        //       padding: EdgeInsets.all(10),
        //       child: Text(
        //         '\$${transactions[index].amount.toStringAsFixed(2)}',
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //           color: Theme.of(context).primaryColorDark,
        //         ),
        //       ),
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           transactions[index].title,
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //         Text(
        //           DateFormat('dd/MM/yy - H:m')
        //               .format(transactions[index].date),
        //           style: TextStyle(color: Colors.grey),
        //         ),
        //       ],
        //     ),
        //   ],
        // ));
      ),
    );
  }
}
