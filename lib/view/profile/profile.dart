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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,0),
                    child: Card(
                      color: StyleManager.instance.backgroundColor,
                      child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('CPF',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: StyleManager.instance.textColor,
                                  )),
                              Text(
                                '123.456.789-00 ',
                                style: TextStyle(
                                  color: StyleManager.instance.textColor,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20,0,20,0),
                      child: Card(
                        color: StyleManager.instance.backgroundColor,
                        child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Data de nascimento',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: StyleManager.instance.textColor,
                                    )),
                                Text(
                                  '28/10/2005',
                                  style: TextStyle(
                                    color: StyleManager.instance.textColor,
                                  ),
                                )
                              ],
                            )),
                      ))
                ],
              ),
            ]))));
  }
}
