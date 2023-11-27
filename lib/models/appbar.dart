import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/controller/ControllerHomePage.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

 HomePageController controller=Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.colorLight,
      title: Obx(
        ()=> Text(
          'Hello, ${controller.username.value}',
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.textColor,
          ),
        ),
      ),
      actions: [
        Container(
          width: 45,
          margin: EdgeInsets.only(right: 15),
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/noprofile.png'),
          ),
        ),
      ],
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
