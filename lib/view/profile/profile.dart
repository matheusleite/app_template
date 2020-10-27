import 'package:app_template/component/form_text_field.dart';
import 'package:app_template/component/validator.dart';
// import 'package:app_template/values/colors.dart' as colors;

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: colors.accentColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
        child: Form(
          key: _key,
          autovalidate: _validate,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Isaias Melo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                )),
                Text('isaias@email.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  backgroundColor: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )),
                SizedBox(height: 60),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('CPF',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                        Text('123.456.789-00 ')
                      ],
                    )
                  ),
                )

                // FormTextField(
                //   controller: _emailController,
                //   validator: Validator().validateEmail,
                //   keyboardType: TextInputType.emailAddress,
                //   placeholder: "EMAIL",
                // ),
                // SizedBox(height: 10),
                // FormTextField(
                //   controller: _passwordController,
                //   validator: Validator().validatePassword,
                //   password: true,
                //   placeholder: "SENHA",
                // ),
          
      ]))))
    );
  }

  

}