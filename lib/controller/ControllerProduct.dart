import 'package:flutter_pas/api/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerProduct extends GetxController {
  RxList<Product> productResponModelCtr =
      <Product>[].obs;

  @override
  void onInit(){
    super.onInit();
    loadData();
  }

  void loadData() async {
    try{
      final response = await http.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

      if (response.statusCode == 200) {
        // mengisi data productResponModelCtr dengan hasil json dari model
        productResponModelCtr.value = productFromJson(response.body);
      } else {
        print("status code : " + response.statusCode.toString());
      }

    }catch(e){
      print("error : "+e.toString());
    }
  }
}