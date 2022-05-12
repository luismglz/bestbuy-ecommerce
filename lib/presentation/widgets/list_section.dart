import 'package:flutter/material.dart';
import 'package:best_buy/common/constants.dart';

class ListSection extends StatelessWidget {
  final String title;

  const ListSection(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 19.0, height: 1, fontWeight: FontWeight.w600),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.arrow_forward,
                          color: Constants.primaryColor),
                    )
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
