import 'package:flutter/material.dart';
import 'package:flutter_pas/pages/home.dart';
import 'package:flutter_pas/pages/login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController usncontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        controller: usncontroller,
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
                        controller: emailcontroller,
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
                        controller: pwcontroller,
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
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(Home()),
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
                    Text(
                      'OR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 20,
                          color: Color(0xff871740)),
                    ),
                    SizedBox(height: 10,),
                    //  
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(onPressed: () {}, 
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        primary: Color(0xffC75E84), 
                        side: BorderSide(width: 1, color: Color(0xffC75E84))
                      ),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/google.png', width: 20, height: 20,),
                          SizedBox(width: 5,),
                          Text('Continue with Google', style: TextStyle(fontFamily: 'ProductSans', fontSize: 16, color: Color(0xffC75E84)))
                        ],
                      ),
                      
                      ),
                    ),
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
      ),
    );
  }
}
