import 'package:flutter/material.dart';

class AppBarCatalogue extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF8E8EE),
      title: Text(
        "Catalogue",
        style: TextStyle(
          fontFamily: "ProductSans",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF830835),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          iconSize: 30,
          color: Color(0xFF830835),
          onPressed: (){},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
