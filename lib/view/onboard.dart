import 'package:app_template/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:app_template/values/color/colors.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({Key key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    StyleManager.instance.init(context);
    return Scaffold(
      key: _globalKey,
      backgroundColor: StyleManager.instance.backgroundColor,
      body: SKOnboardingScreen(
        bgColor: StyleManager.instance.backgroundColor,
        themeColor: StyleManager.instance.accentColor,
        pages: pages(),
        skipClicked: (value) {
          goToLogin();
        },
        getStartedClicked: (value) {
          goToLogin(); 
        },
      ),
    );
  }

  pages() {
    return [
      SkOnboardingModel(
        title: 'Página 1',
        description:'Explicação tutorial página 1',
        titleColor: StyleManager.instance.getTextColor(),
        descripColor: StyleManager.instance.getTextColor(),
        imagePath: 'assets/images/onboard.png'),
      SkOnboardingModel(
        title: 'Página 2',
        description:'Explicação tutorial página 2',
        titleColor: StyleManager.instance.textColor,
        descripColor: StyleManager.instance.textColor,
        imagePath: 'assets/images/onboard.png'),
      SkOnboardingModel(
        title: 'Página 3',
        description:'Explicação tutorial página 3',
        titleColor: StyleManager.instance.textColor,
        descripColor: StyleManager.instance.textColor,
        imagePath: 'assets/images/onboard.png'),
    ];
  }

  void goToLogin() {
    Get.to(LoginPage());
  }
}