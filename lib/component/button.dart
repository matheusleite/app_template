import 'package:app_template/values/color/colors.dart';
import 'package:flutter/material.dart';

typedef void OnTapCallback();

class AppButton extends StatelessWidget {
  final String title;
  final OnTapCallback onTap;

  const AppButton({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InkWell(
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18, fontFamily: 'Manrope', color: ColorManager.instance.textColor, fontWeight: FontWeight.w900),
            )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: ColorManager.instance.gradient()),
          ),
        )),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String image;
  final double height;
  final OnTapCallback onTap;

  const ImageButton({Key key, this.image, this.onTap, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InkWell(
        child: Container(
          height: height,
          child: Image.asset(image, width: height, height: height)
        )),
    );
  }
}