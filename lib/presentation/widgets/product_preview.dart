import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';

class ProductPreview extends StatelessWidget {
  final Product? product;

  const ProductPreview({this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: const BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
          children: <Widget>[
           
            Stack(
              children: <Widget>[
                 
                Positioned(
                    bottom: 40,
                    top: 100,
                    left: 40,
                    child: _ProductWithShadow()),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 65, bottom: 5, right: 7, left: 7),
                  child: FadeInImage.assetNetwork(
                      height: 350,
                      width: 350,
                      placeholder: 'assets/images/loadingWhite.gif',
                      image: product!.image!),
                ),
                Positioned(
              top: 30.0,
              left: 5.0,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 40,
                  color: Colors.white),
            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductWithShadow extends StatelessWidget {
  const _ProductWithShadow({this.product, Key? key}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Constants.primaryColorShadow, blurRadius: 40)
          ]),
    );
  }
}
