import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app_template/values/color/colors.dart';

class Modal {
  final Function(dynamic) onPositive;
  final Function(dynamic) onNegative;
  final String title;
  final String message;
  final AlertType type;

  const Modal({
    this.type,
    this.onPositive,
    this.onNegative,
    this.title,
    this.message
  });

  Alert setAlert(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: ColorManager.instance.primaryColor,
      ),
    );

    return Alert(
      style: alertStyle,
      context: context,
      title: title,
      type: type,
      desc: message,
      buttons: [
        DialogButton(
          child: Text("OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        onPressed: () => Navigator.pop(context),
    )]);
  }
}