import 'package:app_template/component/header.dart';
import 'package:flutter/material.dart';

class SocialNetworkPage extends StatefulWidget {
  @override
  _SocialNetworkPageState createState() => _SocialNetworkPageState();
}

class _SocialNetworkPageState extends State<SocialNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(title: 'Redes Sociais'),
      ],
    );
  }
}
