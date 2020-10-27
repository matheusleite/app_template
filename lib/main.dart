import 'package:app_template/util/theme/dark_theme.dart';
import 'package:app_template/util/theme/theme_provider.dart';
import 'package:flutter/services.dart';
import 'package:app_template/view/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

void main() {

  //set portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  //define app pages transitions
  Transition transition;
  if (Platform.isAndroid) {
    transition = Transition.fade;
  } else if (Platform.isIOS) {
    transition = Transition.cupertino;
  }

  Get.config(enableLog: true, defaultPopGesture: true, defaultTransition: transition);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isLightTheme: false),
        child: App(),
      ),
    );
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'App Template',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getThemeData,
      darkTheme: darkTheme,
      navigatorKey: Get.key,
      home: OnboardPage()
    );
  }
}
