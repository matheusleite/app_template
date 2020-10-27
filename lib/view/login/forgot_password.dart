import 'package:app_template/component/button.dart';
import 'package:app_template/component/edit_text.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, Get.height/6, 30, 00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text('Esqueci minha senha', 
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              fontFamily: StyleManager.instance.fontFamily
            )),
          SizedBox(height: 30),
          EditText(
            dark: false,
            keyboardType: TextInputType.emailAddress,
            placeholder: "EMAIL",
          ),
          SizedBox(height: 30),
          AppButton(
              onTap: () {},
              title: 'Enviar link',
          ),
          SizedBox(height: 100),
          Divider(),
          SizedBox(height: 10),
          Text('Será enviado um link no seu email para cadastro de uma nova senha.', textAlign: TextAlign.center),
      ]))
    );
  }
}