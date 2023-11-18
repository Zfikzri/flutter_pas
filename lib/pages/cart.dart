import 'package:flutter/material.dart';
import 'package:flutter_pas/models/appbar_cart.dart';
import 'package:flutter_pas/models/navbar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Contoh list barang di keranjang
  List<String> cartItems = []; // Gantilah dengan data sebenarnya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCart(),
      backgroundColor: Color(0xFFF8E8EE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //aku ganteng
          if (cartItems.isEmpty)
            Center(
              child: Column(
                children: [
                  Text(
                    'Your Cart Is Empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ProductSans",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF830835)
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You haven\'t added anything yet. Begin\nadding products to your cart and enjoy\nyour shopping experience.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "ProductSans",
                      color: Color(0xFF830835)
                    ),
                  ),
                ],
              ),
            )
          else
            // Tampilkan widget untuk daftar barang di keranjang
            // Gantilah dengan widget yang sesuai dengan data barang di keranjang
            Container(
              // Contoh: Menampilkan daftar barang di dalam ListView
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index]),
                    // Tambahkan widget lain sesuai kebutuhan
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: Navbar(currentIndex: 2),
    );
  }
}
