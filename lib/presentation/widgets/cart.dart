import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:best_buy/common/constants.dart';

class Cart extends StatelessWidget {
  final int numberOfItemsInCart;

  const Cart({Key? key, required this.numberOfItemsInCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //reemplazar overflow con clipBehavior
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          child: SvgPicture.network(
              'https://www.bestbuy.com/~assets/bby/_com/shop/cart-icon/dist/client/images/066a3c85f1c275de42889e546accc7b6.svg'),
        ),
        //If items is minor than 0 circle of cart does not displayed
        if (numberOfItemsInCart > 0)
          Positioned(
              top: -4.0,
              right: -4.0,
              child: Container(
                width: 12.0,
                height: 12.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Constants.secondaryColor, width: 1.0)),
                child: Text(
                  '$numberOfItemsInCart',
                  style: const TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
      ],
    );
  }
}
