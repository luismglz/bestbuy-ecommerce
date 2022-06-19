import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';

class IconBottomBar extends StatelessWidget {

  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

    const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? Constants.primaryColor : Colors.black54
          ),
          highlightColor: Constants.primaryColorShadow,
          splashColor: Constants.primaryColorShadow),

          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? Constants.primaryColor : Colors.black54
            ),
          )
      ],
    );
  }
}