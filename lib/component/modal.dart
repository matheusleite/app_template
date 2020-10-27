import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ndialog/ndialog.dart';

class Modal {
  final Function(dynamic) onPositive;
  final Function(dynamic) onNegative;
  final String title;
  final String message;
  NAlertDialog dialog;

  Modal({
    this.onPositive,
    this.onNegative,
    this.title,
    this.message
  });

  NAlertDialog setAlert(BuildContext context) {
    dialog = NAlertDialog(
      backgroundColor: Colors.black.withOpacity(.80),
      blur: 2,
      dismissable: false,
      dialogStyle: DialogStyle(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        animatePopup: false,
        elevation: 10.0
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
      )],
      title: Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          fontSize: 20
      )),
      content: Text(message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Manrope',
          fontSize: 12
        )),
    );
    return dialog;
  }

}