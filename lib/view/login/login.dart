import 'dart:async';
import 'dart:convert';

import 'package:app_template/component/modal.dart';
import 'package:app_template/component/button.dart';
import 'package:app_template/component/form_text_field.dart';
import 'package:app_template/component/loader.dart';
import 'package:app_template/component/validator.dart';
import 'package:app_template/repository/auth.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:app_template/view/home/home.dart';
import 'package:app_template/view/login/forgot_password.dart';
import 'package:app_template/view/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isFbLoggedIn = false;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  Loader loader = Loader();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleManager.instance.backgroundColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(30, Get.height/6, 30, 00),
        child: Form(
          key: _key,
          autovalidate: _validate,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  fontSize: 60,
                  color: StyleManager.instance.textColor,
                  fontFamily: StyleManager.instance.fontFamily,
                  fontWeight: FontWeight.w600
                )),
                SizedBox(height: 30),
                FormTextField(
                  controller: _emailController,
                  validator: Validator().validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: "EMAIL",
                ),
                SizedBox(height: 10),
                FormTextField(
                  controller: _passwordController,
                  validator: Validator().validatePassword,
                  password: true,
                  placeholder: "SENHA",
                ),
                SizedBox(height: 05),
                GestureDetector(
                  child: Text('Esqueci minha senha', textAlign: TextAlign.end),
                  onTap: goToResetPassword,
                ),
                SizedBox(height: 30),
                AppButton(
                  onTap: _login,
                  title: 'Entrar',
                ),
                SizedBox(height: 10),
                AppButton(
                  onTap: facebookLogin,
                  title: 'Login com Facebook',
                ),
                SizedBox(height: 40),
                Divider(),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text('Ainda não tem conta? Criar nova conta',
                    style: TextStyle(
                      color: StyleManager.instance.textColor),textAlign: TextAlign.center),
                  onTap: goToSignUp,
                )
      ]))))
    );
  }

  void goToResetPassword() {
    Get.to(ForgotPasswordPage());
  }

  void goToSignUp() {
    Get.to(SignUpPage());
  }

  _goToHome() {
    Get.to(HomePage());
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

  _login() async {
    loader.show(context);

    Timer.periodic(
      Duration(seconds: 5), (Timer timer) {
      timer.cancel();
      loader.hide();
      _goToHome();
    });

    if (_key.currentState.validate()) {
      _key.currentState.save();

      //show loading
      // Loader().show();

      final response = await AuthRepository().login(
          _emailController.text,
          _passwordController.text);

      //remove loading
      Loader().hide();

      if (response.status == true) {
        //handle success
        _goToHome();
      } else {
        //handle error
        errorAlert(response.message);
      }

    } else {
      setState(() {
        _validate = true;
      });
    }

  }

  errorAlert(String error) {
    var modal =  Modal(title: "Desculpe...", message: error).setAlert(context);
    modal.show(context);
  }

  successAlert() {
    var modal =  Modal(title: "Desculpe...", message: "OK").setAlert(context);
    modal.show(context);
  }

}