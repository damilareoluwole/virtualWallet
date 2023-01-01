import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static var fontName = 'roboto';
  static var bodyFontSize = 12.0;
  static var bodyFontWeight = FontWeight.w500;
  static var primaryColor = HexColor('#000066');
  static var textColor = HexColor('#646464');

  static var bodyStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: bodyFontWeight,
    fontSize: bodyFontSize,
    letterSpacing: 0.2,
    color: textColor,
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
