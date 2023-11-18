import 'package:flutter/material.dart';
import 'package:flutter_pas/api/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 350,
            height: 350,
            child: Image.asset(
              'assets/ob1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              product.name,
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff830835)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('by' + product.brand.toString(),
                style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 17,
                    color: Color(0xffC75E84))),
          ),
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text('Description',
                style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xff830835))),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
                product.description,
                style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 16,
                    color: Color(0xffC75E84))),
          ),
          Container(height: 25,),
         Padding(
           padding: const EdgeInsets.all(5),
           child: Row(
            children: [
              Expanded(child: Text(product.price, style: TextStyle(fontFamily: 'ProductSans', fontSize: 27, color: Color(0xff830835)),)),
              Container(
                width: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.remove_circle_rounded, color: Color(0xffA3A3A3),),
                  ),
                  Text('0', style: TextStyle(fontFamily: 'ProductSans', fontSize: 27, color: Colors.black),),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child:  Icon(Icons.add_circle_rounded, color: Color(0xff830835),),
                  )
                ],
              )
            ],
           ),
         ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  height: 50,
                  child: OutlinedButton(onPressed: () => (),style: OutlinedButton.styleFrom(
                          
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: Color(0xff830835), 
                          side: BorderSide(width: 2, color: Color(0xff830835))
                        ), child: Icon(Icons.favorite_border_outlined)),
                ),
                Container(width: 10,),
               Expanded(
                 child: Container(
                  height: 50,
                   child: ElevatedButton(
                            onPressed: () => (),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff830835),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                 ),
               ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
