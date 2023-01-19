import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static var fontName = 'Inter';
  static var bodyFontSize = 12.0;
  static var bodyFontWeight = FontWeight.w500;
  static var primaryColor = HexColor('#1AA2B6');
  static var buttonColor = HexColor('#1AA2B6');
  static var iconColor = HexColor('#8EDFEB');
  static var backgroundColor = HexColor('#F8FDFE');
  static var whiteColor = HexColor('#FFFFFF');
  static var darkColor = HexColor('#000000');
  static var ashColor = HexColor('#929099');
  static var lightAshColor = HexColor('#F5F5F5');
  static var darkRed = HexColor('#D92D20');
  static var greenDivider = HexColor('#79CA82');
  static var textLightDarkColor = HexColor('#141318');
  static var placeHolderTextColor = HexColor('#DADADA');

  static var bodyStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: bodyFontWeight,
    fontSize: bodyFontSize,
    letterSpacing: 0.2,
    color: primaryColor,
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
