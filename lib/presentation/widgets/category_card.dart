import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        ),
      child: InkWell(
        
        borderRadius: BorderRadius.circular(10),
        splashColor: Constants.primaryColor,
        onTap: onTap,
        child: Container(
          height: 90,
          width: 130,
          child: Center(
            child: Wrap(
              
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  height: 42,
                  width: 42,
                  child: Image.asset(
                    iconPath,
                    color: Constants.primaryColor,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
