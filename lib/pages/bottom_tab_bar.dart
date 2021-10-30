import 'package:ecommerce/Pages/Account.dart';
import 'package:ecommerce/Pages/home.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  Color primaryColor = Color(0xffE85D5D);
  int _selectedItem = 0;
  List tabItems = [Home(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedItem],
      bottomNavigationBar: FlashyTabBar(
        iconSize: 25,
        animationCurve: Curves.linear,
        selectedIndex: _selectedItem,
        items: [
          FlashyTabBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 16),
              ),
              inactiveColor: Colors.black,
              activeColor: primaryColor),
          FlashyTabBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              title: Text("Account", style: TextStyle(fontSize: 16)),
              inactiveColor: Colors.black,
              activeColor: primaryColor)
        ],
        onItemSelected: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
      ),
    );
  }
}
