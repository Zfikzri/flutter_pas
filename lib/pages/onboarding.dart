import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pas/pages/login.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                
                _currentPage = page;
              });
            },
            children: <Widget>[
              OnboardingSlide(
                image: 'assets/ob1.png',
                title: 'Your Beauty, made easier',
                description: 'An e-commerce application that provides a variety of quality cosmetic products at affordable prices. Get a pleasant and satisfying cosmetics shopping experience.',
                currentPage: _currentPage, 
                pageController: _pageController,
              ),
              OnboardingSlide(
                image: 'assets/ob2.png',
                title: 'Your charm, effortlessly radiated',
                description: 'An e-commerce app that helps you look beautiful and confident. Find a variety of cosmetic products that suit your needs, from makeup, skincare, to haircare',
                currentPage: _currentPage, 
                pageController: _pageController,
              ),
              OnboardingSlide(
                image: 'assets/ob3.png',
                title: 'Your beauty,right in your hands',
                description: 'An e-commerce application that makes it easy for you to get quality cosmetic products. Find various cosmetic products from various well known brands easily and quickly',
                currentPage: _currentPage, 
                pageController: _pageController,
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
             child: InkWell(
               onTap: () {
                  Get.offAll(() => LoginPage());
              },
               child: Text(
               'Skip',
                 style: TextStyle(
                  color: AppColor.backgroundColor, 
                  fontFamily: "ProductSans",
                  fontSize: 20,
                ),
               ),
              ),
             ),

          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  width: 20.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    color: _currentPage == index ? AppColor.backgroundColor : AppColor.colorGrey 
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}