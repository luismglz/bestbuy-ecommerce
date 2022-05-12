import 'package:best_buy/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({ Key? key, this.product }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product!.title!),
    );
  }
}