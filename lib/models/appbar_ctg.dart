import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';

class AppBarCatalogue extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.colorLight,
      title: Text(
        "Catalogue",
        style: TextStyle(
          fontFamily: "ProductSans",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.textColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
