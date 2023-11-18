import 'package:flutter/material.dart';
import 'package:flutter_pas/models/navbar.dart';

class AccountPage extends StatelessWidget {
  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(248, 232, 238, 1),
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
                Navigator.of(context).pop(); // Close the dialog
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
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(248, 232, 238, 1),
        body: Stack(
          children: [
            // Gambar latar belakang setengah halaman
            Container(
              width: double.infinity,
              height: 240,
              child: Image(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            // Konten di atas gambar latar belakang
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gambar lingkaran di antara gambar latar belakang dan warna latar belakang
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 150,
                      width: 150,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/kyliejenner.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: Text(
                      'Kylie Jenner',
                      style: TextStyle(
                          color: Color.fromRGBO(135, 23, 64, 1), fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.settings,
                        color: Color.fromRGBO(135, 23, 64, 1),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Setting',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(135, 23, 64, 1),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(135, 23, 64, 1),
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
                        color: Color.fromRGBO(135, 23, 64, 1),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(135, 23, 64, 1),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(135, 23, 64, 1),
                        size: 24,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 1,
                    width: 480, // Sesuaikan panjang garis bawah
                    color: Color.fromRGBO(135, 23, 64, 1), // Warna garis bawah
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.policy,
                        color: Color.fromRGBO(135, 23, 64, 1),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Terms & Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(135, 23, 64, 1),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(135, 23, 64, 1),
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
                          color: Color.fromRGBO(135, 23, 64, 1),
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(135, 23, 64, 1),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(135, 23, 64, 1),
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
                        color: Color.fromRGBO(135, 23, 64, 1),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Support',
                        style: TextStyle(
                          color: Color.fromRGBO(135, 23, 64, 1),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(135, 23, 64, 1),
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
        bottomNavigationBar: Navbar(currentIndex: 0),
      ),
    );
  }
}
