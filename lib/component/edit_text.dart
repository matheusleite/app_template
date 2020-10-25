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
            color: ColorManager.instance.primaryColor  //cor do texto ao digitar
          ),
          autofocus: autofocus == null ? false : true,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            hintText: placeholder,
            labelText: placeholder,
            errorText: error,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.instance.primaryColor, //cor da borda
                width: 0.0
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.transparent, //cor do placeholder com foco
              fontSize: 16
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              color: ColorManager.instance.primaryColor //cor da label
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.instance.accentColor, //cor da label quando esta com focus
                width: 0
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.instance.primaryColor, //cor da label quando esta com focus
                width: 0
              )
            )
          )
    );
  }
}