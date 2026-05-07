import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    final dateFormat = DateFormat('dd/MM/yyyy');

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.isIncome
            ? Colors.green.withOpacity(0.2)
            : Colors.red.withOpacity(0.2),
        child: Icon(
          transaction.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
          color: transaction.isIncome ? Colors.green : Colors.red,
        ),
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${transaction.category} • ${dateFormat.format(transaction.date)}',
      ),
      trailing: Text(
        '${transaction.isIncome ? '+' : '-'}${currencyFormat.format(transaction.amount)}',
        style: TextStyle(
          color: transaction.isIncome ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
