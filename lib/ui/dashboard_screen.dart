import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_with_transfer/common/app_theme.dart';
import 'package:pay_with_transfer/network/model/transaction_model.dart';
import 'package:pay_with_transfer/network/model/user_model.dart';
import 'package:pay_with_transfer/routes/routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showBalance = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 25,
            right: 20,
            left: 20,
          ),
          color: AppTheme.backgroundColor,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.darkColor,
                ),
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 35,
                  right: 25,
                  bottom: 25,
                ),
                width: 374,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },
                          child: SvgPicture.asset('assets/images/eye.svg',
                              semanticsLabel: 'eye'),
                        )),
                    Text(
                      'Account Balance',
                      style: TextStyle(
                        color: AppTheme.backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      (showBalance) ? user.getBalance() : "****",
                      style: TextStyle(
                        color: AppTheme.backgroundColor,
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.paymentMethod);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.iconColor,
                  ),
                  width: 400,
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(
                      color: AppTheme.darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return transactionsRow(transactions[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: footerTab(),
    );
  }

  Widget footerTab() {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: AppTheme.greenDivider, thickness: 1.2, endIndent: 290),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/home.svg',
                    semanticsLabel: 'home'),
                SvgPicture.asset('assets/images/heart.svg',
                    semanticsLabel: 'heart'),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppTheme.darkColor,
                  child: SvgPicture.asset('assets/images/search.svg',
                      semanticsLabel: 'search'),
                ),
                SvgPicture.asset('assets/images/shopping_cart.svg',
                    semanticsLabel: 'shopping_cart'),
                SvgPicture.asset('assets/images/settings.svg',
                    semanticsLabel: 'settings'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget transactionsRow(TransactionModel item) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.lightAshColor,
          ),
          width: 400,
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item.getAmount(),
                        style: TextStyle(
                          color: item.type == TransactionType.credit
                              ? Colors.green
                              : AppTheme.darkRed,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
