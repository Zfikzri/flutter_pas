import 'package:flutter/material.dart';
import 'package:flutter_pas/common/config.dart';
import 'package:flutter_pas/controller/ControllerProfile.dart';
import 'package:flutter_pas/models/navbar.dart';
import 'package:flutter_pas/pages/login.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.colorLight,
          title: Text('Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                Get.offAll(() => LoginPage());// Close the dialog
                // Perform logout action or navigate to another page
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }


  
  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: AppColor.colorLight,
        body: Stack(
          children: [
            // Gambar latar belakang setengah halaman
            Container(
              width: double.infinity,
              height: 240,
              child: Image.asset(
              'assets/loginpage.png',
                fit: BoxFit.cover,
              ),
            ),
            // Konten di atas gambar latar belakang
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gambar lingkaran di antara gambar latar belakang dan warna latar belakang
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    alignment: Alignment.topCenter, // Sesuaikan dengan kebutuhan Anda
                    height: 150,
                    width: 150,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/noprofile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Container(
                    child: Obx(() =>Text(
                        '${controller.username.value}',
                        style: TextStyle(
                            color: AppColor.textColor, fontSize: 24, fontFamily: 'ProductSans'),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.settings,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Setting',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.textColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Text dan ikon untuk "Payment"
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.payment,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.textColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 1,
                    width: 480, // Sesuaikan panjang garis bawah
                    color: AppColor.textColor, // Warna garis bawah
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.policy,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Terms & Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.textColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      _showLogoutConfirmation(context);
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.logout,
                          color: AppColor.textColor,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.textColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.textColor,
                          size: 24,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Text dan ikon untuk "Payment"
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.support,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Support',
                        style: TextStyle(
                          color: AppColor.textColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.textColor,
                        size: 24,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Navbar(currentIndex: 3),
      ),
    );
  }
}
