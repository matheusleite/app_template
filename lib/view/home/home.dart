import 'package:app_template/values/color/colors.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:getflutter/getflutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double height = 0;
  double itemsHeight = 0;
  List menuColors = [ColorManager.instance.accentColor];
  List menuItems = ["JUST PLAY", "STEP-BY-STEP", "BATTLE", "KIDS ZONE", "MY PROFILE"];

  @override
  Widget build(BuildContext context) {
      height = MediaQuery.of(context).size.height;
      itemsHeight = height/menuItems.length;

      return Scaffold(
        backgroundColor: ColorManager.instance.accentColor,
            body: Container(
                //padding: EdgeInsets.fromLTRB(30, 150, 30, 50),
                child: ListView.builder(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                            return Card(
                                elevation: 0,
                                borderOnForeground: false,
                                shape: ContinuousRectangleBorder(),
                                color: menuColors[0],
                                margin: EdgeInsets.all(0),
                                child: Container(
                                    height: itemsHeight,
                                    child: ListTile(
                                        title: Text(menuItems[index])
                                    ),
                                )
                            );
                        }
            ,
          ),
    ));
  }
}
