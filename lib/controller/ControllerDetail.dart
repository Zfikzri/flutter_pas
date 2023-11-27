import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';
import 'package:get/get.dart';

class ControllerDetail extends GetxController {
  RxList<Product> listmodelctr = <Product>[].obs;
  List<Product> ecommercelistmodel = [];

  Rx<Product?> selectedProduct = Rx<Product?>(null);
  PageController pageController = PageController();
  

  RxInt quantity = 0.obs;
  

  @override
  void onInit() {
    super.onInit();
    print("DetailController initialized");
   

    var arguments = Get.arguments;

    if (arguments != null && arguments is int) {
      int productId = arguments;


      selectedProduct.value = fetchProductDetailsById(productId);
    } else {

      selectedProduct.value = null;
    }
  }


  Product? fetchProductDetailsById(int productId) {
    return ecommercelistmodel.firstWhere(
          (product) => product.id == productId,
     
    );
  }

  void updateQuantity(int newQuantity) {
    quantity.value = newQuantity;
  }

}