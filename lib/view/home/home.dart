import 'package:app_template/component/header.dart';
import 'package:app_template/values/color/colors.dart';
import 'package:app_template/view/profile/profile.dart';
import 'package:app_template/view/social_network/social_network.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleManager.instance.backgroundColor,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            _buildHome(),
            SocialNetworkPage(),
            ProfilePage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: StyleManager.instance.primaryColor,
        currentIndex: _selectedIndex,
        selectedItemColor: StyleManager.instance.accentColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cake_sharp), label: 'Conferência'),
          BottomNavigationBarItem(
              icon: Icon(Icons.share), label: 'Redes Sociais'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Meu Perfil'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  Widget _buildHome() {
    return Column(
      children: [
        PageHeader(title: '#SempreFoiDeus'),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
