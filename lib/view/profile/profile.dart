import 'package:app_template/component/header.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: StyleManager.instance.backgroundColor,
        body: Container(
            // padding: EdgeInsets.fromLTRB(20, 00, 20, 00),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
              PageHeader(title: 'Perfil'),
              Text('Isaias Melo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: StyleManager.instance.textColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              Text('isaias@email.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      backgroundColor: StyleManager.instance.backgroundColor,
                      color: StyleManager.instance.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 60),
              Card(
                color: StyleManager.instance.backgroundColor,
                child: ListTile(
                  // leading: FlutterLogo(size: 56.0),
                  title: Text('CPF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: StyleManager.instance.textColor,
                      )),
                  subtitle: Text(
                    '123.123.123-09',
                    style: TextStyle(
                      color: StyleManager.instance.textColor,
                    ),
                  ),
                ),
              ),
              Card(
                color: StyleManager.instance.backgroundColor,
                child: ListTile(
                    // leading: FlutterLogo(size: 56.0),
                    title: Text('Data de nascimento',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: StyleManager.instance.textColor,
                        )),
                    subtitle: Text(
                      '28/10/2005',
                      style: TextStyle(
                        color: StyleManager.instance.textColor,
                      ),
                    )),
              ),
            ]))));
  }
}
