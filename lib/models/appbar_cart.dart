import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF8E8EE),
      title: Text(
        "Cart",
        style: TextStyle(
          fontFamily: "ProductSans",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF830835),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
