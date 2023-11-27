import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/pages/home.dart';
import 'package:flutter_pas/pages/splash.dart';
import 'package:get/get_navigation/get_navigation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: AppColor.colorLight,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
