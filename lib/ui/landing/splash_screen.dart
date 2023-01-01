import 'package:flutter/material.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.dashboard);
          },
          child: Text('Dashobard', style: AppTheme.bodyStyle),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.paymentMethod);
          },
          child: Text('Payment Method', style: AppTheme.bodyStyle),
        ),
      ],
    );
  }
}
