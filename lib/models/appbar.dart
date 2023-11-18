import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF8E8EE),
      title: Text(
        'Hello, User',
        style: TextStyle(
          fontFamily: 'ProductSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF830835),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite,
            size: 36,
            color: Color(0xFF830835),
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        Container(
          width: 45,
          margin: EdgeInsets.only(right: 15),
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage('https://picsum.photos/seed/772/600'),
          ),
        ),
      ],
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
