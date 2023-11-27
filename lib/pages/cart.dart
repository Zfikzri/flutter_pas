import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas/controller/CartController.dart';
import 'package:flutter_pas/models/appbar_cart.dart';
import 'package:flutter_pas/models/navbar.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<bool> itemCheckedState = [];
  late CartItem cartItem;

  @override
  void initState() {
    Get.put(CartController());
    itemCheckedState =
        List<bool>.filled(CartController.to.cartItems.length, false);
    super.initState();

    final arguments = Get.arguments;
    if (arguments is List<dynamic> && arguments.isNotEmpty) {
      cartItem = arguments.first as CartItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCart(),
      backgroundColor: Color(0xFFF8E8EE),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (CartController.to.cartItems.isEmpty)
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff830835),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'You haven’t added anything yet. Begin\nadding products to your cart and enjoy\nyour shopping experience.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff830835),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: CartController.to.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = CartController.to.cartItems[index];
                          return Card(
                            elevation: 2,
                            margin: EdgeInsets.all(8),
                            child: Container(
                              width: double.infinity,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                leading: CircleAvatar(
                                  child: Checkbox(
                                    value: itemCheckedState[index],
                                    onChanged: (value) {
                                      updateItemCheckedState(index, value!);
                                    },
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Row(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Image.network(
                                          cartItem.imageLink,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItem.name,
                                            style: TextStyle(
                                              fontFamily: "ProductSans",
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'By ${cartItem.brand}',
                                            style: TextStyle(
                                              fontFamily: "ProductSans",
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '\$${cartItem.price}',
                                            style: TextStyle(
                                              fontFamily: "ProductSans",
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            CartController.to
                                                .decreaseQuantity(index);
                                          },
                                        ),
                                        Obx(() =>
                                            Text('${cartItem.quantity.value}')),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            CartController.to
                                                .increaseQuantity(index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (itemCheckedState.contains(true))
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            'Total: \$${CartController.to.totalPrice.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff830835),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height: 16),
                    ],
                  ),
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        showPaymentDetailsPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF871740),
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "ProductSans",
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Buy'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Navbar(currentIndex: 2),
    );
  }

  void showPaymentDetailsPopup(BuildContext context) {
    final cartItems = CartController.to.cartItems;
    double total = CartController.to.totalPrice.value;

    List<CartItem> checkedItems = [];
    for (int i = 0; i < cartItems.length; i++) {
      if (itemCheckedState[i]) {
        checkedItems.add(cartItems[i]);
      }
    }

    Get.defaultDialog(
      title: 'Payment Details',
      backgroundColor: Color(0xFFF8E8EE),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < checkedItems.length; i++)
            ListTile(
              leading: Image.network(
                checkedItems[i].imageLink,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                '${checkedItems[i].name} x ${checkedItems[i].quantity.value} - \$${checkedItems[i].price * checkedItems[i].quantity.value}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          SizedBox(height: 10),
          Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xFFF8E8EE),
              onPrimary: Colors.black, 
              elevation: 0, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff830835), 
              onPrimary: Colors.white, 
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          onPressed: () {
            Get.back();
            showPaymentSuccessfulPopup();
          },
          child: Text('Buy'),
        ),
      ],
    );
  }

  void showPaymentSuccessfulPopup() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Color(0xFFF8E8EE),
        title: Column(
          children: [
            Text(
              'Payment Successfull!!',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "ProductSans",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff830835)),
            ),
            SizedBox(height: 10.0),
            Icon(
              Icons.check_circle_outline,
              color: Color(0xff830835),
              size: 90.0,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFF8E8EE),
            ),
            child: null,
          ),
        ],
      ),
      barrierDismissible: true,
    );

    Future.delayed(Duration(seconds: 4), () {
      Get.back();
    });
  }

  void updateItemCheckedState(int index, bool value) {
    setState(() {
      itemCheckedState[index] = value;
    });
    CartController.to.updateTotalPrice(itemCheckedState);
  }
}
