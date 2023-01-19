import 'package:flutter/material.dart';
import 'package:pay_with_transfer/common/app_theme.dart';

Widget transferButton({required String title, required Function() onPressed})
{
  return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.buttonColor,
          ),
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
}