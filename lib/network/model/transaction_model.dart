import 'package:intl/intl.dart';

var transactions = <TransactionModel>[];

class TransactionModel {
  String title;
  String date;
  double amount;
  TransactionType type;
  final number = NumberFormat("#,##0", "en_US");

  TransactionModel(
      {required this.title,
      required this.date,
      required this.amount,
      required this.type});

  String getAmount() {
    var prefix = (type == TransactionType.debit) ? "-N" : "N";
    return prefix + number.format(amount);
  }
}

enum TransactionType { credit, debit }
