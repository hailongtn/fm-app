import 'package:flutter/foundation.dart';
import '../models/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _transactions = [
    TransactionModel(
      id: '1',
      title: 'Lương tháng 5',
      amount: 15000000,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: 'Lương',
      isIncome: true,
    ),
    TransactionModel(
      id: '2',
      title: 'Ăn trưa',
      amount: 50000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Ăn uống',
      isIncome: false,
    ),
    TransactionModel(
      id: '3',
      title: 'Đổ xăng',
      amount: 100000,
      date: DateTime.now(),
      category: 'Di chuyển',
      isIncome: false,
    ),
  ];

  List<TransactionModel> get transactions {
    final sorted = [..._transactions]
      ..sort((a, b) => b.date.compareTo(a.date));
    return sorted;
  }

  List<TransactionModel> get recentTransactions {
    final sorted = [..._transactions]
      ..sort((a, b) => b.date.compareTo(a.date));
    return sorted.take(5).toList();
  }

  void addTransaction(TransactionModel tx) {
    _transactions.add(tx);
    notifyListeners();
  }

  double get totalIncome {
    return _transactions
        .where((tx) => tx.isIncome)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double get totalExpense {
    return _transactions
        .where((tx) => !tx.isIncome)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double get balance {
    return totalIncome - totalExpense;
  }
}
