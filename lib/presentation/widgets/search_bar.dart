import 'package:best_buy/presentation/widgets/promo_card.dart';
import 'package:best_buy/services/ProductServices.dart';
import 'package:flutter/material.dart';
import 'package:best_buy/common/constants.dart';

import '../../model/product.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  Product? product;
  ProductServices productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 28.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              offset: const Offset(0.0, 1.0),
              blurRadius: 50,
            )
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
          decoration: const InputDecoration(
        icon: Icon(Icons.search, color: Constants.primaryColor),
        border: InputBorder.none,
        hintText: 'What are you looking for?...',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
      ),
      onChanged: (String text){
      },
      ),
    );
  }
}
