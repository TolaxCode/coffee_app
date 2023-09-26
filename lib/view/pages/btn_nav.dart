import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/view/pages/account_page.dart';
import 'package:coffee/view/pages/bag_page.dart';

import 'package:coffee/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class BtnNav extends StatefulWidget {
  const BtnNav({super.key});

  @override
  State<BtnNav> createState() => _BtnNavState();
}

int _selectIndex = 0;

class _BtnNavState extends State<BtnNav> {
  //select btn nav page
  void _selectPage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  //list page of btn nav
  final List<Widget> _pages = [
    const HomePage(),
    const BagPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed, //use btnNav bigger than 3 use this 
        selectedItemColor: colorsItem,
        currentIndex: _selectIndex,
        selectedLabelStyle: fontBtnNavSelect,
        unselectedLabelStyle: fontBtnNavUnselect,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout_outlined,
              size: 30,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
