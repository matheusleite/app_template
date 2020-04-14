import 'package:app_template/component/edit_text.dart';
import 'package:app_template/component/form_text_field.dart';
import 'package:app_template/component/validator.dart';
import 'package:app_template/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_social_button.dart';
import 'package:getflutter/types/gf_button_type.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
        child: Form(
          key: _key,
          autovalidate: _validate,
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
                FormTextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  placeholder: "NOME",
                  validator: Validator().validateName,
                ),
                SizedBox(height: 10),
                FormTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: "EMAIL",
                  validator: Validator().validateEmail,
                ),
                SizedBox(height: 10),
                FormTextField(
                  controller: _passwordController,
                  password: true,
                  placeholder: "SENHA",
                  validator: Validator().validatePassword,
                ),
                SizedBox(height: 30),
                GFButton(
                  onPressed: _signUp,
                  text: 'Enviar dados',
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
              ])),
        )
    );
  }

  String _validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  _signUp() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      //TODO: show loading

      final response = await AuthRepository().signUp(
          _nameController.text,
          _emailController.text,
          _passwordController.text);

      //TODO: remove loading

      if (response.status == true) {
        //handle success
      } else {
        //handle error
      }

    } else {
      setState(() {
        _validate = true;
      });
    }

  }
}