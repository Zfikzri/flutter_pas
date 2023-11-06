import 'package:flutter/material.dart';
import 'package:flutter_pas/pages/home.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 4), 
      () {
        Get.offAll(() => Home()); 
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "aeria", 
              style: TextStyle(
                fontFamily: "Gloria Ramsey",
                fontSize: 115,
                color: Color(0xFFA52B57),  
                 height: 0.10,
              ),
         
            ),
            Text(
              "everyone is beauty", 
              style: TextStyle(
                fontFamily: "ProductSans",
                fontSize: 19,
                color: Color(0xFFC75E84), 
               
              ),
        
            ),
          ],
        ),
      ),
    );
  }
}
