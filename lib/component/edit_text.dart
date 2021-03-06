import 'package:flutter/material.dart';
import 'package:app_template/values/color/colors.dart';

class EditText extends StatelessWidget {

  final bool autofocus;
  final Function(dynamic) onChange;
  final String placeholder;
  final String error;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;

  const EditText({
    Key key, 
    this.autofocus,
    this.placeholder,
    this.error,
    this.keyboardType,
    this.onChange,
    this.password,
    this.dark,
    this.multiline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
          obscureText: password == true ? true : false,
          onChanged: onChange,
          maxLines: multiline == true ? null : 1,
          keyboardType: multiline == true ? TextInputType.multiline : keyboardType,
          style: TextStyle(
            color: StyleManager.instance.textColor  //cor do texto ao digitar
          ),
          autofocus: autofocus == null ? false : true,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            hintText: placeholder,
            labelText: placeholder,
            errorText: error,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: StyleManager.instance.textColor, //cor da borda
                width: 1
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.transparent, //cor do placeholder com foco
              fontSize: 16
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              color: StyleManager.instance.textColor //cor da label
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: StyleManager.instance.textColor, //cor da label quando esta com focus
                width: 1
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: StyleManager.instance.textColor, //cor da label quando esta com focus
                width: 3
              )
            )
          )
    );
  }
}