import 'package:get/get.dart';

class DetailItem {
  final String name;
  final String brand;
  final double price;
  final RxInt quantity;
  final String imageLink;

  DetailItem({
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

class DetailController extends GetxController {
  static DetailController to = Get.find();

  RxList<DetailItem> detailItems = <DetailItem>[].obs;


  void increaseQuantity(int index) {
    detailItems[index].increaseQuantity();
  }

  void decreaseQuantity(int index) {
    detailItems[index].decreaseQuantity();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
