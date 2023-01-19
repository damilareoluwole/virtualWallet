import 'package:flutter/material.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/common/common_widget.dart';
import 'package:pay_with_transfer/network/model/user_model.dart';
import 'package:pay_with_transfer/ui/transfer/confirm_payment_screen.dart';
import 'package:pay_with_transfer/ui/transfer/transfer_screen_frame.dart';

class TransactionAmountScreen extends StatefulWidget {
  const TransactionAmountScreen({super.key});

  @override
  State<TransactionAmountScreen> createState() =>
      _TransactionAmountScreenState();
}

class _TransactionAmountScreenState extends State<TransactionAmountScreen> {
  var amountInput = "";
  @override
  Widget build(BuildContext context) {
    return TransferScreenFrmae(
      title: "Transfer Payment",
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter Amount',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.lightAshColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 7,
                bottom: 7,
              ),
              child: TextField(
                onChanged: ((value) {
                  amountInput = value;
                }),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppTheme.placeHolderTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'N0.00',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          transferButton(
            title: 'Make Payment',
            onPressed: () {
              var amount = double.tryParse(amountInput);
              if (amount == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Invalid input amount"),
                  ),
                );
              } else if (amount < 100) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Amount can not be less than N100"),
                  ),
                );
              } else if (amount > user.balance) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Insufficient funds"),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConfirmPaymentScreen(amount: amount)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
