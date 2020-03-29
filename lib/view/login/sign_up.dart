import 'package:app_template/component/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_social_button.dart';
import 'package:getflutter/types/gf_button_type.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text('Cadastro', 
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600
            )),
          SizedBox(height: 30),
          EditText(
            dark: false,
            keyboardType: TextInputType.emailAddress,
            placeholder: "NOME",
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 30),
          GFButton(
            onPressed: (){},
            text: 'Entrar',
            fullWidthButton: true,
            type: GFButtonType.solid,
          ),
          SizedBox(height: 10),
          GFSocialButton(
            onPressed: () {},
            text: 'Cadastro com Facebook',
            icon: Icon(Icons.share),
          ),
          SizedBox(height: 100),
          Divider(),
          SizedBox(height: 10),
          GestureDetector(
            child: Text('Já tem uma conta? Faça login', textAlign: TextAlign.center),
            onTap: () {},
          )
      ]))
    );
  }
}