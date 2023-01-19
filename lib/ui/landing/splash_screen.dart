import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/network/api/api_helper.dart';
import 'package:pay_with_transfer/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final delayTime = 5;

  @override
  Widget build(BuildContext context) {
    ApiHelper().getTransactionHistory();
    ApiHelper().getUser();

    Future.delayed(Duration(seconds: delayTime), () {
      Navigator.pushReplacementNamed(context, Routes.dashboard);
    });

    return Scaffold(
      body: Container(
      height: MediaQuery.of(context).size.height,
      color: AppTheme.darkColor,
      padding: const EdgeInsets.only(top: 40),
      child: Stack(children: [
        SvgPicture.asset('assets/images/hand_drawn_line.svg',
            semanticsLabel: 'Hand Drawn Line'),
        Positioned(
            bottom: 0,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Help You \nDigitise Your \nFinances',
                          style: TextStyle(
                              color: AppTheme.backgroundColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                    ),
                    const SizedBox(height: 60),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                          'assets/images/hand_drawn_line_1.svg',
                          semanticsLabel: 'Hand Drawn Line'),
                    )
                  ],
                )))
      ]),
    ));
  }
}
