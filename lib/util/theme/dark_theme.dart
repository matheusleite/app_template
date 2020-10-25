import 'package:flutter/material.dart';
import '../../values/color/colors.dart';

final ThemeData darkTheme = ThemeData(
    fontFamily: 'Manrope',
    primaryColor: ColorManager.instance.primaryColor,
    accentColor: ColorManager.instance.accentColor,
    scaffoldBackgroundColor: ColorManager.instance.backgroundColor,
    appBarTheme: AppBarTheme(
        color: ColorManager.instance.accentColor,
        iconTheme: IconThemeData(color: ColorManager.instance.darkColor)),
    buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.instance.accentColor,
        disabledColor: ColorManager.instance.darkColor));
