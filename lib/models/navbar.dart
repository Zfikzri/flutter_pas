import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/pages/accountpage.dart';
import 'package:flutter_pas/pages/cart.dart';
import 'package:flutter_pas/pages/catalogue.dart';
import 'package:flutter_pas/pages/home.dart';

import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  Navbar({required this.currentIndex});

  void onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Get.offAll(HomePage());
    } else if (index == 1) {
      Get.offAll(Catalogue());    
    }
    else if(index == 2){
      Get.offAll(Cart());
    }
    else if(index == 3){
      Get.offAll(AccountPage());
    }    
}

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.colorLight,
      selectedItemColor: AppColor.textColor,
      unselectedItemColor: AppColor.backgroundColor,
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
