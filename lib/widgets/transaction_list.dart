import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransacationList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransacationList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 518,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/sleep.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}

