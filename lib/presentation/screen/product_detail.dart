import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:best_buy/presentation/widgets/product_preview.dart';

class ProductDetail extends StatelessWidget {
  final Product? product;
  const ProductDetail({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ProductPreview(
          product: product,
        ),
        ProductInformation(product: product)
      ],
    ));
  }
}
