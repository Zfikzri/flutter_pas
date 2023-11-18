import 'package:flutter/material.dart';

class CategoryCatalogue extends StatelessWidget {
  final List<String> categories;

  CategoryCatalogue({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return buildCategoryCard(categories[index]);
        },
      ),
    );
  }
 
  Widget buildCategoryCard(String category) {
    Color cardColor = category == "Popular" ? Color(0xFFC75E84) : Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: cardColor,
        child: Container(
          width: 130,
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "ProductSans",
                color: category == "Popular" ? Colors.white : Color(0xFF830835),
              ),
            ),
          ),
        ),
      ),
    );
  }
}