import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/controller/ControllerLogin.dart';
import 'package:flutter_pas/pages/signup.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = Get.put(LoginController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Image.asset(
              'assets/loginpage.png',
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: AppColor.colorLight),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
                width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Log in',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: AppColor.textColor),
                        textAlign: TextAlign.center),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'If you already have an account, you can input your log in information here.',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 14,
                            color: AppColor.backgroundColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        controller: ctrUsername,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: AppColor.backgroundColor,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.backgroundColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.backgroundColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  AppColor.backgroundColor, width: 1),
                            ),
                            focusColor:  AppColor.backgroundColor,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: AppColor.backgroundColor,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: ctrPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor:  AppColor.backgroundColor,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color:  AppColor.backgroundColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:  AppColor.backgroundColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  AppColor.backgroundColor, width: 1),
                            ),
                            focusColor: AppColor.backgroundColor,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color:  AppColor.backgroundColor,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          loginController.loginAction(ctrUsername.text, ctrPassword.text);

                        },
                        style: ElevatedButton.styleFrom(
                            primary:  AppColor.backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.colorWhite,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have account?',
                          style: TextStyle(
                              fontSize: 14,
                              color:  AppColor.backgroundColor,
                              fontFamily: 'ProductSans'),
                        ),
                        InkWell(
                          onTap: () => Get.to(SignUpPage()),
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(
                                fontFamily: 'ProductSans',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color:  AppColor.backgroundColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
