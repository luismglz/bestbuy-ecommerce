import 'package:another_flushbar/flushbar.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/services/ProductServices.dart';
import 'package:flutter/material.dart';
import 'package:best_buy/presentation/widgets/category_card.dart';
import 'package:best_buy/presentation/widgets/header.dart';
import 'package:best_buy/presentation/widgets/section.dart';
import 'package:best_buy/presentation/widgets/list_section.dart';
import 'package:best_buy/presentation/widgets/promo_card.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/presentation/screen/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Product? product;
  ProductServices productServices = ProductServices();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Header(),
      Section(
          'Categories',
          DemoElement.categories.map((category) {
            return CategoryCard(
                title: category.title,
                iconPath: category.iconPath,
                onTap: () {
                  print(category.title);
                });
          }).toList()),
      ListSection('Today\'s popular picks'),
      Container(
          child: FutureBuilder(
              future: productServices.getProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    heightFactor: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Image.network(
                              "https://img.icons8.com/pastel-glyph/100/000000/page-not-found--v2.png"),
                        ),
                        const Text(
                          "Not data",
                          style: TextStyle(
                              fontSize: 20,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: PromoCard(
                                product: snapshot.data[index],
                              ));
                        }),
                  ),
                );
              }))
    ])));
  }
}

