import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData darkTheme = ThemeData(
  primaryColor: colors.primaryColor,
  accentColor: colors.accentColor,
  scaffoldBackgroundColor: colors.backgroundColor,
  appBarTheme: AppBarTheme(
    color: colors.accentColor,
    iconTheme: IconThemeData(color: colors.darkColor)
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: colors.accentLightColor,
    disabledColor: colors.primaryColorDark
  )
);