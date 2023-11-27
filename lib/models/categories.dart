import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/models/header.dart';

class Categories extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Map<String, dynamic>> categories;

  Categories({
    required this.title,
    required this.subTitle,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: title),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryCard(
                    imageLink: categories[index]['image'],
                    name: categories[index]['name'],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageLink;
  final String name;

  CategoryCard({required this.imageLink, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 175,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
  width: 50,
  height: 50,
  child: Image.asset(
    imageLink,
    fit: BoxFit.cover,
  ),
),

              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  fontFamily: "ProductSans",
                  fontSize: 18,
                  color: AppColor.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
