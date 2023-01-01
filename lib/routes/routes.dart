import 'package:flutter/material.dart';
import 'package:pay_with_transfer/ui/dashboard_screen.dart';
import 'package:pay_with_transfer/ui/landing/splash_screen.dart';
import 'package:pay_with_transfer/ui/transfer/payment_method_screen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    Routes.splash: (context) => const SplashScreen(),
    Routes.dashboard: (context) => const DashboardScreen(),
    Routes.paymentMethod: (context) => const PaymentMethodScreen(),
  };
}

class Routes {
  static const splash = 'splash';
  static const dashboard = 'dashboard';
  static const paymentMethod = 'payment/start';
}
