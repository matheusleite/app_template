import 'package:app_template/component/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/types/gf_button_type.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text('Esqueci minha senha', 
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
          SizedBox(height: 30),
          GFButton(
            onPressed: (){},
            text: 'Enviar link',
            fullWidthButton: true,
            type: GFButtonType.solid,
          ),
          SizedBox(height: 100),
          Divider(),
          SizedBox(height: 10),
          Text('Será enviado um link no seu email para cadastro de uma nova senha.', textAlign: TextAlign.center),
      ]))
    );
  }
}