import 'package:app_template/component/alert.dart';
import 'package:app_template/component/form_text_field.dart';
import 'package:app_template/component/loader.dart';
import 'package:app_template/component/validator.dart';
import 'package:app_template/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_social_button.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
          child: SingleChildScrollView(
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
                  validator: Validator().validateName,
                  keyboardType: TextInputType.text,
                  placeholder: "NOME",
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
                SizedBox(height: 40),
                Divider(),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text('Já tem uma conta? Faça login', textAlign: TextAlign.center),
                  onTap: () {},
                )
              ]))),
        )
    );
  }

  _signUp() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      //show loading
      Loader().show();

      final response = await AuthRepository().signUp(
          _nameController.text,
          _emailController.text,
          _passwordController.text);

      //remove loading
      Loader().hide();

      if (response.status == true) {
        //handle success
        successAlert();
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
    var alert = Modal(type: AlertType.error, title: "Desculpe...", message: error).setAlert(context);
    alert.show();
  }

  successAlert() {
    var alert = Modal(type: AlertType.info, title: "Pronto!", message: "Cadastro realizado com sucesso!").setAlert(context);
    alert.show();
  }
}