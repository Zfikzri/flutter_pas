import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subTitle; 

  const Header({
    Key? key,
    required this.title,
    required this.subTitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "ProductSans",
              color: const Color(0xFF830835),
            ),
          ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize:  15,
                fontFamily: "ProductSans",
                color:  const Color(0xFF820000),
              ),
            ),
        ],
      ),
    );
  }
}
