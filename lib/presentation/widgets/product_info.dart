import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductInformation extends StatelessWidget {
  final Product? product;
  const ProductInformation({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.title!,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            ),
            Text(
              "Model: " + product!.modelTag!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(right: 111),
                child: RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 30,
                  initialRating: product!.rating!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double value) {},
                )),
            Text(
              product!.rating!.toDouble().toString(),
              style: const TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Row(children: [
              Text(
                product!.category! == "Smartphones"
                    ? "\$" + product!.price!.toString() + "(Activate Today)"
                    : "\$" + product!.price!.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 10),
              Text(
                product!.category == "Smartphones" ? "" : "or",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 10),
              Text(
                product!.category == "Smartphones"
                    ? ""
                    : "\$" +
                        calculateMonthlyPayment(product!.price!.toDouble())!
                            .toStringAsFixed(2) +
                        "/month",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ]),
            Text(
              product!.category! == "Smartphones" ? "One-time payment" : "",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            Text(
              product!.isPromo! == 1 ? "OFFER " : "",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Constants.isOfferColor
                  ),
            ),
          ],
        ),
      ),
    );
  }

  double? calculateMonthlyPayment(double price) {
    return price / 24;
  }
}
