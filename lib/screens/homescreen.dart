import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/helper/getcat.dart';
import 'package:flutter_application_1/helper/getproduct.dart';
import 'package:flutter_application_1/screens/QRViewExample.dart';
import 'package:flutter_application_1/screens/cartscreen.dart';
import 'package:flutter_application_1/screens/catprodscreen.dart';
import 'package:flutter_application_1/screens/hometab.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_application_1/screens/visaScreen.dart';
import 'package:flutter_riverpod/all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeTab(),
    QRViewExample(),
    CartScreen(),
    //VisaScreen()
  ];

  var searchController = TextEditingController();
  int _selectedIndex = 0; //New

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, backcolor])),
      child: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: btnColor, size: 40),
          selectedItemColor: btnColor,
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Chats',
            ),
          ],
        ),
      ),
    );
  }
}
