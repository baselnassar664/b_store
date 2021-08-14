import 'package:b_store/bottom_bar/setting_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/material.dart';

import '../models/bottom_bar.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<BottomBar> _bar=[
    BottomBar(text: 'Home',screen: HomeScreen()),
    BottomBar(text: 'Cart',screen: CartScreen()),
    BottomBar(text: 'Favourite',screen: favoriteScreen()),
    BottomBar(text: 'Setting',screen: SettingScreen()),
  ];
int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(_bar[_selectedIndex].text,
        style: TextStyle(color: AppColors.app_text1,

        fontSize: SizeConfig.scaleTextFont(20,)),)
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int selectedIndex){
          setState(() {
            _selectedIndex=selectedIndex;
          });
        },
        currentIndex:  _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.app_color,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.scaleWidth(12),
        ),
        unselectedItemColor: Color(0xffC0C0C0),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.scaleWidth(12),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Setting',
          ),
        ],
      ),
      body: _bar[_selectedIndex].screen,
    );
  }
}
