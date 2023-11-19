import 'package:get/get.dart';

class CartItem {
  final String name;
  final String brand;
  final double price;
  final RxInt quantity;
  final String imageLink;

  CartItem({
    required this.name,
    required this.brand,
    required this.price,
    required int initialQuantity,
    required this.imageLink,
  }) : quantity = initialQuantity.obs;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}

class CartController extends GetxController {
  static CartController to = Get.find();

  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(CartItem item) {
    var existingItem = cartItems.firstWhereOrNull((e) => e.name == item.name);

    if (existingItem != null) {
      existingItem.increaseQuantity();
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  void increaseQuantity(int index) {
    cartItems[index].increaseQuantity();
  }

  void decreaseQuantity(int index) {
    cartItems[index].decreaseQuantity();
  }

  double get totalPrice {
    double total = 0.0;
    for (CartItem item in cartItems) {
      total += item.quantity.value * item.price;
    }
    return total;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
