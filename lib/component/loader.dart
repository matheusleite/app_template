import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loader  {
  show() {
    EasyLoading.show(status: 'Carregando...');
  }

  hide() {
    EasyLoading.dismiss();
  }
}