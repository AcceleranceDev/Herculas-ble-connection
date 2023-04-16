import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: FontConstant.timNewRoman,
      scaffoldBackgroundColor: ColorConst.scaffoldColor,
      cardColor: ColorConst.dashboardCardColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.buttonColor,
          elevation: 6,
        ),
      ),
    );
  }
}
