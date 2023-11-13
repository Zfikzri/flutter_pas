import 'package:flutter/material.dart';
import 'package:flutter_pas/pages/home.dart';
import 'package:get/get.dart';

class OnboardingSlide extends StatelessWidget {
  
  final String image;
  final String title;
  final String description;
  final int currentPage; 
  final PageController pageController;

  OnboardingSlide({required this.image, required this.title, required this.description, required this.currentPage, required this.pageController});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(16),
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFFF8E8EE),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "ProductSans-Bold",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF830835),
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "ProductSans",
                  color: Color(0xFFC75E84) ,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (currentPage < 2) {
                  pageController.animateToPage(currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.ease);
                } else {
                  Get.offAll(() => HomePage());
                }
                },
                style: ElevatedButton.styleFrom(
                 primary: Color(0xFFC75E84), 
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10.0),
               ),
               minimumSize: Size(double.infinity, 50), 
               ),
               child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 18),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
