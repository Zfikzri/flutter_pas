import 'package:flutter/material.dart';
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
                  color: Color(0xffF8E8EE)),
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
                            color: Color(0xff830835)),
                        textAlign: TextAlign.center),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Create your account and enjoy exclusive access to special offers!',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 14,
                            color: Color(0xffC75E84)),
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
                            prefixIconColor: Color(0xffC75E84),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Color(0xffC75E84),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffC75E84), width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84), fontFamily: 'ProductSans'),
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
                            prefixIconColor: Color(0xffC75E84),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Color(0xffC75E84),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffC75E84), width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84), fontFamily: 'ProductSans'),
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
                            prefixIconColor: Color(0xffC75E84),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Color(0xffC75E84),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffC75E84), width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84), fontFamily: 'ProductSans'),
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
                            prefixIconColor: Color(0xffC75E84),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Color(0xffC75E84),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffC75E84), width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84), fontFamily: 'ProductSans'),
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
                            primary: Color(0xffC75E84),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Colors.white,
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
                                color: Color(0xffC75E84),
                                fontFamily: 'ProductSans'),
                          ),
                          InkWell(
                            onTap: () => Get.to(LoginPage()),
                            child: Text(' Log In', style: TextStyle(fontFamily: 'ProductSans', fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xffA52B57)),),
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
