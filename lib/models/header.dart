import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/pages/catalogue.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final String title;

  Header({
    Key? key,
    required this.title,
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
              color:  AppColor.textColor,
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => Catalogue());
            },
            child: Text(
              "Show All",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "ProductSans",
                color:  AppColor.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
