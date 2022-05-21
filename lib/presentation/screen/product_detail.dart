import 'package:best_buy/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {

   final Product? product;
  const ProductDetail({this.product});

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.product!.title!),
      ),
    );
  }
}