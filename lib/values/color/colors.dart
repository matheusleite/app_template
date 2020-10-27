import 'package:flutter/material.dart';

class ColorManager {

    bool isDark;

    //list of colors
    //clean theme is default
    Color accentColor = Colors.greenAccent;
    Color primaryColor = Colors.white;
    Color textColor = Colors.black45;
    Color secondaryTextColor = Colors.grey;
    Color backgroundColor = Colors.white;
    Color darkColor = Colors.black45;

    //singleton setting
    static final ColorManager _singleton = new ColorManager._internal();
    ColorManager._internal();
    static ColorManager get instance => _singleton;

    init(BuildContext context) {
        final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
        isDark = brightnessValue == Brightness.dark;

        //change if dark mode is enabled
        if (isDark) {
            accentColor = Colors.blueAccent;
            primaryColor = Colors.black45;
            textColor = Colors.white;
            darkColor = Colors.white;
            backgroundColor = Colors.black12;
        }
    }

    getAccentColor() {
        return accentColor;
    }

    getTextColor() {
        return textColor;
    }

    gradient() {
        return [Colors.blueAccent, Colors.blue];
    }

}



//light theme colors
// final Color accentColor = Color(0xFF5ccaba);
// final Color accentLightColor = Color(0xFF74dccc);
//
// final menuColors = [
//     Color.fromRGBO(14, 0, 255, 1),
//     Color.fromRGBO(0, 102, 255, 1),
//     Color.fromRGBO(0, 148, 255, 1),
//     Color.fromRGBO(0, 184, 255, 1),
//     Color.fromRGBO(0, 217, 255, 1),
//     Color.fromRGBO(43, 245, 255, 1)
// ];
//
// final Color primaryColor = Colors.white;
// final Color primaryColorDark = Color(0xFFa5acb8);
//
// final Color darkColor = Colors.black;
//
// final Color textColor = Colors.black;
// final Color disabledTextColor = Color(0xFFa1a1a1);
// final Color disabledColor = Colors.black38;
// final Color disabledListViewColor = Color(0xFFf7f7f7);
//
// final Color backgroundColor = Colors.white;
// final Color canvasColor = Colors.transparent;
//
// final Color snackbarBackgroundColor = Colors.black87;
// final Color toastBackgroundColor = Colors.black87;
// final Color toastTextColor = Colors.white;

//dark theme colors
// final Color accentColor = Color(0xFF5ccaba);
// final Color accentLightColor = Color(0xFF74dccc);

// final Color primaryColor = Colors.white;
// final Color primaryColorDark = Color(0xFFa5acb8);

// final Color darkColor = Colors.black;

// final Color disabledTextColor = Color(0xFFa1a1a1);
// final Color disabledColor = Colors.black38;
// final Color disabledListViewColor = Color(0xFFf7f7f7);

// final Color backgroundColor = Color(0xFF333639);
// final Color canvasColor = Colors.transparent;

// final Color snackbarBackgroundColor = Colors.black87;
// final Color toastBackgroundColor = Colors.black87;
// final Color toastTextColor = Colors.white;