import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/controller/CartController.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 0;

  void addToCart() {
    CartController.to.addToCart(
      CartItem(
        name: widget.product.name,
        brand: widget.product.brand.toString(),
        price: double.parse(widget.product.price),
        initialQuantity: quantity,
        imageLink: widget.product.imageLink,
      ),
    );

    Get.snackbar(
      'Add Succesful',
      'Item Added to cart',
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: 350,
                  height: 350,
                  child: Image.network(
                    widget.product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.product.name,
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColor.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'by ' + widget.product.brand.toString(),
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 17,
                      color: AppColor.backgroundColor,
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
                      color: AppColor.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 16,
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$${widget.product.price}',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 27,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: AppColor.colorGrey,
                          ),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 27,
                            color: AppColor.colorBlack,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_rounded,
                            color: AppColor.textColor,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
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
                          onPressed: () => addToCart(),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.textColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.colorWhite,
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
