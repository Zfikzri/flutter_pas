import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:flutter_pas/controller/ControllerProduct.dart';
import 'package:flutter_pas/pages/detail.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  final productController = Get.put(ControllerProduct());

  ProductListWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => productController.isLoading.value
            ? CircularProgressIndicator()
            : Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (products.length / 2).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    int startIndex = index * 2;
                    int endIndex = startIndex + 2;
                    if (endIndex > products.length) {
                      endIndex = products.length;
                    }

                    List<Product> slicedProducts =
                        products.getRange(startIndex, endIndex).toList();

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: slicedProducts.map((product) {
                          return buildProductCard(product);
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(product: product));
      },
      child: Card(
        child: Container(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageLink,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
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
      ),
    );
  }
}
