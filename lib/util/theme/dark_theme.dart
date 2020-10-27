import 'package:flutter/material.dart';
import '../../values/color/colors.dart';

final ThemeData darkTheme = ThemeData(
    fontFamily: 'Manrope',
    primaryColor: StyleManager.instance.primaryColor,
    accentColor: StyleManager.instance.accentColor,
    scaffoldBackgroundColor: StyleManager.instance.backgroundColor,
    appBarTheme: AppBarTheme(
        color: StyleManager.instance.accentColor,
        iconTheme: IconThemeData(color: StyleManager.instance.darkColor)),
    buttonTheme: ButtonThemeData(
        buttonColor: StyleManager.instance.accentColor,
        disabledColor: StyleManager.instance.darkColor));
