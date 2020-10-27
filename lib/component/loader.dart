import 'package:app_template/values/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

class Loader  {

  CustomProgressDialog loader;
  BuildContext pageContext;

  show(BuildContext context) {
    pageContext = context;
    loader = CustomProgressDialog(context,
      dismissable: false,
      loadingWidget: Center(
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorManager.instance.accentColor))
        ),
      ),
      backgroundColor: Colors.black.withOpacity(.80),
    );
    return loader.show();
  }

  hide() {
    Navigator.pop(pageContext);
    // loader.onDismiss();
  }
}