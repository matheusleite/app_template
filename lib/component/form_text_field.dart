import 'package:flutter/material.dart';
import 'package:app_template/values/colors.dart' as colors;

class FormTextField extends StatelessWidget {

  final String placeholder;
  final String Function(String) validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool password;

  const FormTextField({
    Key key,
    this.placeholder,
    this.validator,
    this.keyboardType,
    this.password,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: password == true ? true : false,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            hintText: placeholder,
            labelText: placeholder,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: colors.primaryColorDark, //cor da borda
                  width: 0.0
              ),
            ),
            hintStyle: TextStyle(
                color: Colors.transparent, //cor do placeholder com foco
                fontSize: 16
            ),
            labelStyle: TextStyle(
                fontSize: 16,
                color: colors.primaryColorDark //cor da label
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: colors.primaryColorDark, //cor da label quando esta com focus
                    width: 0
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: colors.primaryColorDark, //cor da label quando esta com focus
                    width: 0
                )
            )
        )
    );
  }

}