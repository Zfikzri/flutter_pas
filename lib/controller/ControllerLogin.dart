import 'package:flutter_pas/models/login_response.dart';
import 'package:flutter_pas/pages/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;


  void loginAction(String username, String password) async {
    try {
      
      isLoading.value = true;
      if(username.isEmpty || password.isEmpty) {
        message.value = "Fields cannot be empty";

        isLoading.value = false;
        return;
      }

      final url = Uri.parse("https://mediadwi.com/api/latihan/login");
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      final body = {
        "username": username,
        "password": password
      };

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
print(response.body);
      if(response.statusCode == 200) {

        
     final responseData = loginResponseModelFromJson(response.body);

  
    

    if(responseData.token != null && responseData.token != ""){
         prefs = await SharedPreferences.getInstance();
     await prefs.setString('token', responseData.token);
     
     await prefs.setString('username', username); 
    }
        Get.offAll(() => HomePage());
         
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print(e);
    }
  }

}