import 'package:flutter/material.dart';

import 'package:flutter_pas/models/navbar.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("Ini dummy"),),
    bottomNavigationBar: Navbar(currentIndex: 1),
    );
  }
}