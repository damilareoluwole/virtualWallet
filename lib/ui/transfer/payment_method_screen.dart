import 'package:flutter/material.dart';
import 'package:pay_with_transfer/common/app_theme.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text('Welcome to Payment method Screen', style: AppTheme.bodyStyle),
    );
  }
}
