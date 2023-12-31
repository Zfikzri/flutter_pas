import 'package:flutter/material.dart';
import 'package:flutter_pas/controller/ControllerProduct.dart';
import 'package:flutter_pas/models/appbar.dart';
import 'package:flutter_pas/models/categories.dart';
import 'package:flutter_pas/models/header.dart';
import 'package:flutter_pas/models/navbar.dart';
import 'package:flutter_pas/models/textfield.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = Get.put(ControllerProduct());
  bool isFavourite = false;

  List<Map<String, dynamic>> categories = [
    {
      'image': 'assets/cg1.png',
      'name': 'Lipstick',
    },
    {
      'image': 'assets/cg2.png',
      'name': 'Mascara',
    },
    {
      'image': 'assets/cg3.png',
      'name': 'Eye Palette',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final allPadding = EdgeInsets.all(10.0);

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFF8E8EE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: allPadding,
              child: CustomTextField(hintText: "Search..."),
            ),
            Obx(() {
              return Column(
                children: [
                  Header(title: "Popular", subTitle: "Show All"),
                  Padding(
                    padding: allPadding,
                    child: Container(
                      height: 270,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            productController.productResponModelCtr.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product =
                              productController.productResponModelCtr[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          child: Image.network(
                                            product.imageLink,
                                            height: 160,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            isFavourite
                                                ? Icons.favorite_outline
                                                : Icons.favorite,
                                            size: 25,
                                            color: Color(0xFF830835),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isFavourite = !isFavourite;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 3.0),
                                      child: Text(
                                        product.name,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: "ProductSans",
                                            color: Color(0xFF830835),
                                            fontSize: 13),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 3.0),
                                      child: Text(
                                        '\$${product.price}',
                                        style: TextStyle(
                                            fontFamily: "ProductSans",
                                            color: Color(0xFF830835),
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
            Categories(
                title: "Categories",
                subTitle: "Show All",
                categories: categories),
            Padding(
              padding: allPadding,
              child: Column(
                children: [
                  Header(title: "New Stuff", subTitle: "Show All"),
                ],
              ),
            ),
            Padding(
  padding: allPadding,
  child: Obx(() {
    return Container( 
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (productController.productResponModelCtr.length / 2).ceil(),
        itemBuilder: (BuildContext context, int index) {
          int startIndex = index * 2;
          int endIndex = startIndex + 2;
          if (endIndex > productController.productResponModelCtr.length) {
            endIndex = productController.productResponModelCtr.length;
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(endIndex - startIndex, (subIndex) {
                final product =
                    productController.productResponModelCtr[startIndex + subIndex];
                return Card(
                  child: Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.network(
                              product.imageLink,
                              height: 190,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Color(0xFF830835),
                              ),
                              onPressed: () {
                                print('Icon Heart pressed ...');
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 3.0,
                          ),
                          child: Text(
                            product.name,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: "ProductSans",
                              color: Color(0xFF830835),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 3.0,
                          ),
                          child: Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontFamily: "ProductSans",
                              color: Color(0xFF830835),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }),
),

          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: 0),
    );
  }
}
