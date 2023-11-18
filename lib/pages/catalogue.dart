import 'package:flutter/material.dart';
import 'package:flutter_pas/models/appbar_ctg.dart';
import 'package:flutter_pas/models/categories_ctg.dart';
import 'package:flutter_pas/models/navbar.dart';
import 'package:flutter_pas/models/product_card.dart';
import 'package:flutter_pas/models/textfield.dart';
import 'package:flutter_pas/controller/ControllerProduct.dart';
import 'package:get/get.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({Key? key}) : super(key: key);

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  final productController = Get.put(ControllerProduct());

  final List<String> ctg = [
    "Popular",
    "New Stuff",
    "Mascara",
    "Eye Palette",
    "Lipstick"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCatalogue(),
      backgroundColor: Color(0xFFF8E8EE),
      bottomNavigationBar: Navbar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextField(hintText: "Search..."),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCatalogue(categories: ctg),
                    ProductListWidget(
                        products: productController.productResponModelCtr),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



