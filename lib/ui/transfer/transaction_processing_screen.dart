import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_with_transfer/ui/transfer/transfer_screen_frame.dart';

class TransactionProcessingScreen extends StatefulWidget {
  const TransactionProcessingScreen({super.key});

  @override
  State<TransactionProcessingScreen> createState() =>
      _TransactionProcessingScreenState();
}

class _TransactionProcessingScreenState
    extends State<TransactionProcessingScreen> {
  @override
  Widget build(BuildContext context) {
    var delayTime = 2;
    Future.delayed(Duration(seconds: delayTime), () {
      Navigator.pop(context);
    });
    return TransferScreenFrmae(
      title: "Transfer Payment",
      showBack: false,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          SvgPicture.asset(
            'assets/images/processing_clock.svg',
            semanticsLabel: 'processing',
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Processing',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Please hold on while we confirm your payment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
