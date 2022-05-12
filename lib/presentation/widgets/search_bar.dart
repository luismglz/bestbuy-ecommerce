import 'package:flutter/material.dart';
import 'package:best_buy/common/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

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
        hintText: 'What are you looking for?...',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
      )),
    );
  }
}
