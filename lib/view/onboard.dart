import 'package:app_template/util/navigation/nav_slide_from_right.dart';
import 'package:app_template/view/login/login.dart';
import 'package:flutter/material.dart';
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
    ColorManager.instance.init(context);
    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorManager.instance.backgroundColor,
      body: SKOnboardingScreen(
        bgColor: ColorManager.instance.backgroundColor,
        themeColor: ColorManager.instance.accentColor,
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
        titleColor: ColorManager.instance.getTextColor(),
        descripColor: ColorManager.instance.getTextColor(),
        imagePath: 'assets/images/onboard.png'),
      SkOnboardingModel(
        title: 'Página 2',
        description:'Explicação tutorial página 2',
        titleColor: ColorManager.instance.textColor,
        descripColor: ColorManager.instance.textColor,
        imagePath: 'assets/images/onboard.png'),
      SkOnboardingModel(
        title: 'Página 3',
        description:'Explicação tutorial página 3',
        titleColor: ColorManager.instance.textColor,
        descripColor: ColorManager.instance.textColor,
        imagePath: 'assets/images/onboard.png'),
    ];
  }

  void goToLogin() {
    Navigator.push(context, NavSlideFromRight(page: LoginPage()));
  }
}