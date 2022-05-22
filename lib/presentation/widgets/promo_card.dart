import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/screen/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/rendering.dart';

class PromoCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  Product product;

//Create class for
  PromoCard({Key? key, required this.product, this.onTap}) : super(key: key);
  void showLayoutGuidelines() {
    debugPaintSizeEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: InkWell(
          borderRadius: BorderRadius.circular(17),
          splashColor: Constants.primaryColor,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          product: product,
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 10),
                  child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: FadeInImage.assetNetwork(
                          height: 100,
                          width: 100,
                          placeholder: 'assets/images/loading.gif',
                          image: product
                              .image!) /*Image.network(
                        product.image!,
                        height: 100,
                        width: 100,
                      )*/
                      ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              width: 200,
                              child: Text(
                                product.title!,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: RatingBar.builder(
                                itemSize: 15,
                                initialRating: product.rating!.toDouble(),
                                minRating: 1,
                                ignoreGestures: true, 
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (double value) {},
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '\$' + product.price.toString() + "",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ])
                        ]),
                    Row(children: []),
                  ],
                ),
              ]),
            ],
          ),
        ));
  }
}
