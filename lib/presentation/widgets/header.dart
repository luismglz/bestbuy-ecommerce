import 'package:flutter/material.dart';
import 'package:best_buy/presentation/widget/search_bar.dart';
import 'package:best_buy/presentation/widget/cart.dart';
import 'package:best_buy/model/demo_element.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 70, 190, 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(),
              child: Image.network(
                  'https://1000marcas.net/wp-content/uploads/2020/05/logo-Best-Buy.png',
                  height: 75)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top deals',
                style: TextStyle(
                    fontSize: 20.0,
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Cart(numberOfItemsInCart: DemoElement.numberOfItemsInCart),
            ],
            //simulando que hay items en carrito de compra
          ),
          Row(
            children: const [
              Text('Enjoy a safe, convenient shopping experience',
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 2,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.start),
            ],
          ),
          Row(
            children: const [],
          ),
          SearchBar()
        ],
      ),
    );
  }
}
