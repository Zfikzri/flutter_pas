import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/controller/ControllerSignup.dart';
import 'package:flutter_pas/pages/login.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final registerController= Get.put(RegisterController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrConfirm = TextEditingController();
  final TextEditingController ctrEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Stack(
          children: [
            Image.asset('assets/loginpage.png'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: AppColor.colorLight),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Sign Up',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: AppColor.textColor),
                        textAlign: TextAlign.center),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Create your account and enjoy exclusive access to special offers!',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 14,
                            color: AppColor.backgroundColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                              borderSide:
                                  BorderSide(color: AppColor.backgroundColor, width: 1),
                            ),
                            focusColor: AppColor.backgroundColor,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: AppColor.backgroundColor, fontFamily: 'ProductSans'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: ctrEmail,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            prefixIconColor: AppColor.backgroundColor,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.backgroundColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.backgroundColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.backgroundColor, width: 1),
                            ),
                            focusColor: AppColor.backgroundColor,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: AppColor.backgroundColor, fontFamily: 'ProductSans'),
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
                            prefixIconColor: AppColor.backgroundColor,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.backgroundColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.backgroundColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.backgroundColor, width: 1),
                            ),
                            focusColor: AppColor.backgroundColor,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color:AppColor.backgroundColor, fontFamily: 'ProductSans'),
                      ),
                    ),
                    SizedBox(height:10,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        controller: ctrConfirm,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_person),
                            prefixIconColor:AppColor.backgroundColor,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.backgroundColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:AppColor.backgroundColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.backgroundColor, width: 1),
                            ),
                            focusColor: AppColor.backgroundColor,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: AppColor.backgroundColor, fontFamily: 'ProductSans'),
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
                           registerController.registerAction(ctrUsername.text, ctrEmail.text, ctrPassword.text, ctrConfirm.text);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: AppColor.colorWhite,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    SizedBox(height: 10,),
      
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account?',
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.backgroundColor,
                                fontFamily: 'ProductSans'),
                          ),
                          InkWell(
                            onTap: () => Get.to(LoginPage()),
                            child: Text(' Log In', style: TextStyle(fontFamily: 'ProductSans', fontSize: 14, fontWeight: FontWeight.bold, color:AppColor.textColor),),
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
