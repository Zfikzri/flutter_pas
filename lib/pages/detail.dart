import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:flutter_pas/controller/CartController.dart';
import 'package:flutter_pas/controller/ControllerDetail.dart';
import 'package:flutter_pas/controller/ControllerProduct.dart';
import 'package:flutter_pas/pages/cart.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ControllerDetail controller = Get.put(ControllerDetail());
  Product product;
  final ecommercecontroller = Get.put(ControllerProduct());

  void addToCart() {
    CartItem cartItem = CartItem(
      name: product.name,
      brand: product.brand.toString(),
      price: double.parse(product.price),
      initialQuantity: controller.quantity.value,
      imageLink: product.imageLink,
    );

    CartController.to.addToCart(cartItem);

    Get.snackbar(
      'Add Successful',
      'Item Added to cart',
      duration: Duration(seconds: 3),
    );

   
    Get.to(() => Cart(), arguments: cartItem);
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
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Color(0xffA3A3A3),
                  ),
                  onPressed: () {
                    // Handle decrease quantity
                    if (controller.quantity.value > 1) {
                      controller.updateQuantity(controller.quantity.value - 1);
                    }
                  },
                ),
                Obx(() => Text(
                  '${controller.quantity}',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 20,
                    color: Color(0xff830835),
                  ),
                )),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: Color(0xff830835),
                  ),
                  onPressed: () {
                    // Handle increase quantity
                    controller.updateQuantity(controller.quantity.value + 1);
                  },
                ),
              ],
            ),
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
