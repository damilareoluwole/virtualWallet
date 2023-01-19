import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final number = NumberFormat("#,##0", "en_US");
  return "N${number.format(amount)}";
}
