import 'package:flutter/material.dart';

class StyleManager {

    bool isDark;
    String fontFamily = 'Manrope';

    //list of colors
    //clean theme is default
    Color accentColor = Colors.blueAccent;
    Color primaryColor = Colors.white;
    Color textColor = Colors.black;
    Color secondaryTextColor = Colors.grey;
    Color backgroundColor = Colors.white;
    Color darkColor = Colors.black45;

    //singleton setting
    static final StyleManager _singleton = new StyleManager._internal();
    StyleManager._internal();
    static StyleManager get instance => _singleton;

    init(BuildContext context) {
        final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
        isDark = brightnessValue == Brightness.dark;

        //change if dark mode is enabled
        if (isDark) {
            accentColor = Colors.blueAccent;
            primaryColor = Colors.black45;
            textColor = Colors.white;
            darkColor = Colors.white;
            backgroundColor = Colors.white10;
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