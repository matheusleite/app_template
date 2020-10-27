import 'package:app_template/util/theme/dark_theme.dart';
import 'package:app_template/util/theme/theme_provider.dart';
import 'package:flutter/services.dart';
import 'package:app_template/view/onboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  //set portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
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
      home: OnboardPage()
    );
  }
}
