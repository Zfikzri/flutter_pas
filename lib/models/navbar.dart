import 'package:flutter/material.dart';
import 'package:flutter_pas/pages/dummy.dart';
import 'package:flutter_pas/pages/home.dart';

import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  Navbar({required this.currentIndex});

  void onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Get.offAll(HomePage());
    } else if (index == 1) {
      Get.offAll(Dummy());    
    }
    // else if(index == 2){
    //   Get.offAll(Dummy());
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFF8E8EE),
      selectedItemColor: Color(0xFF871740),
      unselectedItemColor: Color(0xFFC75E84),
      currentIndex: currentIndex,
      onTap: (index) => onTabTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.spa,
            size: 30,
          ),
          label: "Catalogue",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_mall,
            size: 30,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30,
          ),
          label: "Account",
        ),
      ],
    );
  }
}
