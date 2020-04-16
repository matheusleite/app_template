import 'dart:convert';

import 'package:app_template/component/edit_text.dart';
import 'package:app_template/util/navigation/nav_slide_from_right.dart';
import 'package:app_template/view/login/forgot_password.dart';
import 'package:app_template/view/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_social_button.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isFbLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text('Login', 
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600
            )),
          SizedBox(height: 30),
          EditText(
            dark: false,
            keyboardType: TextInputType.emailAddress,
            placeholder: "EMAIL",
          ),
          SizedBox(height: 10),
          EditText(
            dark: false,
            password: true,
            placeholder: "SENHA",
          ),
          SizedBox(height: 05),
          GestureDetector(
            child: Text('Esqueci minha senha', textAlign: TextAlign.end),
            onTap: goToResetPassword,
          ),
          SizedBox(height: 30),
          GFButton(
            onPressed: login,
            text: 'Entrar',
            fullWidthButton: true,
            type: GFButtonType.solid,
          ),
          SizedBox(height: 10),
          GFSocialButton(
            onPressed: facebookLogin,
            text: 'Login com Facebook',
            icon: Icon(Icons.share),
          ),
          SizedBox(height: 40),
          Divider(),
          SizedBox(height: 10),
          GestureDetector(
            child: Text('Ainda não tem conta? Criar nova conta', textAlign: TextAlign.center),
            onTap: goToSignUp,
          )
      ]))
    );
  }

  void goToResetPassword() {
    Navigator.push(context, NavSlideFromRight(page: ForgotPasswordPage()));
  }

  void goToSignUp() {
    Navigator.push(context, NavSlideFromRight(page: SignUpPage()));
  }

  void facebookLogin() async {
    var facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    var facebookLoginResult = await facebookLogin.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onFbLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onFbLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");

        var graphResponse = await Dio().get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.data);
        print(profile.toString());

        onFbLoginStatusChanged(true);
        break;
    }
  }

  void onFbLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isFbLoggedIn = isLoggedIn;
    });
  }

  void login() {

  }

}