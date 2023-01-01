import 'package:flutter/material.dart';
import 'package:pay_with_transfer/common/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to dashboard screen', style: AppTheme.bodyStyle),
    );
  }
}
