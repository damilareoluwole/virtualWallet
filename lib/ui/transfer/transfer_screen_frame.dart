import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_with_transfer/common/app_theme.dart';

class TransferScreenFrmae extends StatelessWidget {
  const TransferScreenFrmae(
      {super.key,
      required this.title,
      required this.child,
      this.showBack = true});

  final String title;
  final Widget child;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 45, right: 25, left: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    if (showBack)
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/images/arrow_left.svg',
                            semanticsLabel: 'arrow'),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: AppTheme.darkColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
