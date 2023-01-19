import 'package:intl/intl.dart';

var user = UserModel(name: '', balance: 0);

class UserModel {
  String name;
  double balance;

  final number = NumberFormat("#,##0", "en_US");

  UserModel({required this.name,required this.balance});

  String getBalance() {
    return "N${number.format(balance)}";
  }
}
