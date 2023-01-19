import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/routes/routes.dart';
import 'package:pay_with_transfer/ui/transfer/transfer_screen_frame.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TransferScreenFrmae(
      title: "Make Payment",
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.paymentAmount);
            },
            child: paymentMethods(
              iconName: 'credit_card',
              title: 'Pay with Card',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.paymentAmount);
            },
            child: paymentMethods(
              iconName: 'smartphone',
              title: 'Pay by Bank Transfer',
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethods({required String iconName, required String title}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/$iconName.svg',
                semanticsLabel: iconName,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textLightDarkColor),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/images/chevron_right.svg',
                    semanticsLabel: 'wallet',
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
