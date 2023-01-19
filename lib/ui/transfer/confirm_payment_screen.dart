import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/common/common_widget.dart';
import 'package:pay_with_transfer/common/helper_functions.dart';
import 'package:pay_with_transfer/ui/transfer/transaction_completed_screen.dart';
import 'package:pay_with_transfer/ui/transfer/transaction_processing_screen.dart';
import 'package:pay_with_transfer/ui/transfer/transfer_screen_frame.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  final double amount;
  const ConfirmPaymentScreen({super.key, required this.amount});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  var timeLeft = 30 * 60;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (v) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft <= 0) {
        timeLeft = 0;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TransferScreenFrmae(
      title: "Transfer Payment",
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                formateSec(timeLeft),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: SvgPicture.asset(
                  'assets/images/clock.svg',
                  semanticsLabel: 'clock',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppTheme.backgroundColor,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                accountDetailsRow(
                  title: 'Bank Name',
                  child: Text(
                    'Wema Bank',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textLightDarkColor,
                    ),
                  ),
                ),
                accountDetailsRow(
                  title: 'Account Name',
                  child: Text(
                    'Payvalue Services',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textLightDarkColor,
                    ),
                  ),
                ),
                accountDetailsRow(
                  title: 'Account Number',
                  child: Text(
                    '0459827051',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textLightDarkColor,
                    ),
                  ),
                  showCopyIcon: true,
                ),
                accountDetailsRow(
                  title: 'Amount',
                  child: Text(
                    formatAmount(widget.amount),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textLightDarkColor,
                    ),
                  ),
                ),
                accountDetailsRow(
                  title: 'Order Number',
                  child: Text(
                    'DAF00478',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textLightDarkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppTheme.lightAshColor,
            ),
            padding: const EdgeInsets.all(22),
            width: MediaQuery.of(context).size.width,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.darkColor,
                  height: 1.4,
                ),
                children: [
                  const TextSpan(
                    text: 'Kindly make the transfer of ',
                  ),
                  TextSpan(
                    text: formatAmount(widget.amount),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ' to Payvalue Services with account number 0459827051 within the next 30mins.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          transferButton(
            title: 'Confirm Payment',
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (v) => const TransactionProcessingScreen(),
              );
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TransactionCompletedScreen(amount: widget.amount)),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget accountDetailsRow(
      {required String title, required Text child, bool showCopyIcon = false}) {
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
            child: (showCopyIcon)
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        child,
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset('assets/images/copy.svg'),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: child,
                  ),
          ),
        ],
      ),
    );
  }

  String formateSec(int timeLeft) {
    if(timeLeft <= 0) return '0:0';
    var min = timeLeft ~/ 60;
    var sec = timeLeft - min * 60;

    return "$min:$sec";
  }
}
