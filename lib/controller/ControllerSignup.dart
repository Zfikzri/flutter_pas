import 'package:flutter_pas/models/signup_response.dart';
import 'package:flutter_pas/pages/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  void registerAction(
    String username,
    String email,
    String password,
    String confirmPassword
  ) async {
    try {

      isLoading.value  = true;
      if(username.isEmpty ||  email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        message.value = "Fields cannot be empty";

        isLoading.value = false;
        return;
      }
      if(password != confirmPassword) {
        message.value = "Password and confirmation password do not match";

        isLoading.value = false;
        return;
      }

      final url = Uri.parse("https://mediadwi.com/api/latihan/register-user");
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      final body = {
        "username": username,
        "full_name": username,
        "email": email,
        "password": password
      };

      final response = await http.post(
        url,
        headers: headers,
        body: body
      );

      if(response.statusCode == 200) {
        final responseData = registerResponseModelFromJson(response.body);
        message.value = responseData.message;

        isLoading.value = false;

        if(responseData.status) Get.off(() => LoginPage());
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print(e);
    }
  }
}