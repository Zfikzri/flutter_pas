// detail.dart
import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:flutter_pas/controller/CartController.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({required this.product});

  void addToCart(Product product) {
    CartController.to.addToCart(
      CartItem(
        name: product.name,
        brand: product.brand.toString(),
        price: double.parse(product.price),
        initialQuantity: 1,
        imageLink: product.imageLink,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView(
        children: [
          Container(
            width: 350,
            height: 350,
            child: Image.network(
              product.imageLink,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              product.name,
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff830835),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'by ' + product.brand.toString(),
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 17,
                color: Color(0xffC75E84),
              ),
            ),
          ),
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Description',
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xff830835),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.description,
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 16,
                color: Color(0xffC75E84),
              ),
            ),
          ),
          Container(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 27,
                      color: Color(0xff830835),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.remove,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 27,
                          color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.add_circle_rounded,
                        color: Color(0xff830835),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => addToCart(product),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff830835),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
