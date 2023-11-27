import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/models/appbar_ctg.dart';
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
  final TextEditingController searchController = TextEditingController();

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = productController.productResponModelCtr;
  }

  void filterProducts(String query) {
    List<Product> filteredList = productController.productResponModelCtr
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredProducts = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCatalogue(),
      backgroundColor: AppColor.colorLight,
      bottomNavigationBar: Navbar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: "Search...",
                onChanged: (query) {
                  filterProducts(query);
                },
                controller: searchController,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductListWidget(products: filteredProducts),
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
