import 'package:flutter/material.dart';
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
                  color: Color(0xffF8E8EE)),
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
                            color: Color(0xff830835)),
                        textAlign: TextAlign.center),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'If you already have an account, you can input your log in information here.',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 14,
                            color: Color(0xffC75E84)),
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
                              borderSide: BorderSide(
                                  color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84),
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
                              borderSide: BorderSide(
                                  color: Color(0xffC75E84), width: 1),
                            ),
                            focusColor: Color(0xffC75E84),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                        style: TextStyle(
                            color: Color(0xffC75E84),
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
                            primary: Color(0xffC75E84),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: 'ProductSans',
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'OR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 20,
                          color: Color(0xff871740)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            primary: Color(0xffC75E84),
                            side:
                                BorderSide(width: 1, color: Color(0xffC75E84))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/google.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Continue with Google',
                                style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    fontSize: 16,
                                    color: Color(0xffC75E84)))
                          ],
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
                              color: Color(0xffC75E84),
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
                                color: Color(0xffA52B57)),
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
