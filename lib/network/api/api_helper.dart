import 'package:pay_with_transfer/network/model/transaction_model.dart';
import 'package:pay_with_transfer/network/model/user_model.dart';

class ApiHelper {
  var baseUrl = '';
  List<TransactionModel> getTransactionHistory() {
    return transactions = [
      TransactionModel(
          title: 'Data Purchase',
          date: '18 December, 2022',
          amount: 5000.7,
          type: TransactionType.debit),
      TransactionModel(
          title: 'Airtime Purchase',
          date: '19 December, 2022',
          amount: 3000,
          type: TransactionType.debit),
      TransactionModel(
          title: 'Data Purchase',
          date: '19 December, 2022',
          amount: 10000,
          type: TransactionType.debit),
      TransactionModel(
          title: 'Cable Payment',
          date: '01 January, 2023',
          amount: 1000,
          type: TransactionType.debit),
      TransactionModel(
          title: 'Airtime Purchase',
          date: '29 December, 2022',
          amount: 30000,
          type: TransactionType.debit),
      TransactionModel(
          title: 'Data Purchase',
          date: '03 Janauary, 2023',
          amount: 1500,
          type: TransactionType.debit),
    ];
  }

  UserModel getUser() {
    return user = UserModel(name: 'Damilare Oluwole', balance: 230000);
  }
}
