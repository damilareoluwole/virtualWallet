import 'package:flutter/material.dart';
import 'package:pay_with_transfer/ui/dashboard_screen.dart';
import 'package:pay_with_transfer/ui/landing/splash_screen.dart';
import 'package:pay_with_transfer/ui/transfer/payment_method_screen.dart';
import 'package:pay_with_transfer/ui/transfer/transaction_amount_screen.dart';
import 'package:pay_with_transfer/ui/transfer/transaction_processing_screen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    Routes.splash: (context) => const SplashScreen(),
    Routes.dashboard: (context) => const DashboardScreen(),
    Routes.paymentMethod: (context) => const PaymentMethodScreen(),
    Routes.paymentAmount: (context) => const TransactionAmountScreen(),
    Routes.paymentProcessing: (context) => const TransactionProcessingScreen(),
  };
}

class Routes {
  static const splash = 'splash';
  static const dashboard = 'dashboard';
  static const paymentMethod = 'payment/start';
  static const paymentAmount = 'payment/amount';
  static const paymentProcessing = 'payment/processing';
}
