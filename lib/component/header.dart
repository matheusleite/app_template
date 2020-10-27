import 'package:app_template/values/color/colors.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final double marginBottom;
  final double marginTop;
  const PageHeader({
    @required this.title,
    this.marginTop,
    this.marginBottom,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: marginTop ?? 80),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            title,
            style: TextStyle(
              color: StyleManager.instance.textColor,
              fontSize: 30.0,
              fontFamily: StyleManager.instance.fontFamily,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        SizedBox(height: marginBottom ?? 20),
      ],
    );
  }
}
