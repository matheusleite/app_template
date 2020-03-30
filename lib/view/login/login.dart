import 'package:app_template/component/edit_text.dart';
import 'package:app_template/util/navigation/nav_slide_from_right.dart';
import 'package:app_template/view/login/forgot_password.dart';
import 'package:app_template/view/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_social_button.dart';
import 'package:getflutter/types/gf_button_type.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          SizedBox(height: 100),
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

  void facebookLogin() {

  }

  void login() {

  }

}