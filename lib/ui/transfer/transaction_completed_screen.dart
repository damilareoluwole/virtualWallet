import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/common/common_widget.dart';
import 'package:pay_with_transfer/common/helper_functions.dart';
import 'package:pay_with_transfer/network/model/transaction_model.dart';
import 'package:pay_with_transfer/network/model/user_model.dart';
import 'package:pay_with_transfer/routes/routes.dart';
import 'package:pay_with_transfer/ui/transfer/transfer_screen_frame.dart';

class TransactionCompletedScreen extends StatefulWidget {
  final double amount;
  const TransactionCompletedScreen({super.key, required this.amount});

  @override
  State<TransactionCompletedScreen> createState() =>
      _TransactionCompletedScreenState();
}

class _TransactionCompletedScreenState
    extends State<TransactionCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    var transactionDate = DateFormat('dd MMMM, yyyy').format(DateTime.now());
    return TransferScreenFrmae(
      title: "Transfer Payment",
      showBack: false,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SvgPicture.asset(
            'assets/images/complete_check.svg',
            semanticsLabel: 'processing',
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Congratulations!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Payment Confirmed Successfully',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppTheme.backgroundColor,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction Receipt',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textLightDarkColor,
                  ),
                ),
                const Divider(),
                accountDetailsRow(
                  title: 'Amount',
                  value: formatAmount(widget.amount),
                ),
                accountDetailsRow(
                  title: 'Account Name',
                  value: 'Payvalue Services',
                ),
                accountDetailsRow(
                  title: 'Account Number',
                  value: '0459827051',
                ),
                accountDetailsRow(
                  title: 'Order Number',
                  value: 'DAF00478',
                ),
                accountDetailsRow(
                  title: 'Date',
                  value: transactionDate,
                ),
              ],
            ),
          ),
          transferButton(
            title: 'Go Back to Home Page',
            onPressed: () {
              user.balance -= widget.amount;
              transactions.insert(
                  0,
                  TransactionModel(
                      title: "Payvalue Services",
                      date: transactionDate,
                      amount: widget.amount,
                      type: TransactionType.debit));
              Navigator.pushReplacementNamed(context, Routes.dashboard);
            },
          ),
        ],
      ),
    );
  }

  Widget accountDetailsRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.ashColor,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textLightDarkColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
