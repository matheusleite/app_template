import 'package:app_template/component/button.dart';
import 'package:app_template/component/form_text_field.dart';
import 'package:app_template/component/loader.dart';
import 'package:app_template/component/validator.dart';
import 'package:app_template/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: EdgeInsets.fromLTRB(30, Get.height / 6, 30, 00),
      child: Form(
          key: _key,
          autovalidate: _validate,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                Text('Cadastro',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
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
                AppButton(
                  onTap: _signUp,
                  title: 'Cadastrar',
                ),
                SizedBox(height: 40),
                Divider(),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text('Já tem uma conta? Faça login',
                      textAlign: TextAlign.center),
                  onTap: () {
                    Get.back();
                  },
                )
              ]))),
    ));
  }

  _signUp() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      //show loading
      Loader().show(context);

      final response = await AuthRepository().signUp(_nameController.text,
          _emailController.text, _passwordController.text);

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
    // var alert = Modal(type: AlertType.error, title: "Desculpe...", message: error).setAlert(context);
    // alert.show();
  }

  successAlert() {
    // var alert = Modal(type: AlertType.info, title: "Pronto!", message: "Cadastro realizado com sucesso!").setAlert(context);
    // alert.show();
  }
}
