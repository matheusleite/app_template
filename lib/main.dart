import 'package:app_template/values/dark_theme.dart';
import 'package:app_template/values/theme.dart';
import 'package:app_template/view/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Template',
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      home: LoginPage()
    );
  }
}
