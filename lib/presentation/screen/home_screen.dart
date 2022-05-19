import 'package:another_flushbar/flushbar.dart';
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
                  print(productServices.getProducts());
                });
          }).toList()),
      ListSection(
        'Today\'s popular picks'
      ),
        FutureBuilder(
            future: productServices.getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                print(snapshot.data);
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(snapshot.data);
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ListTile(
                          title: Text(
                            snapshot.data[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(snapshot.data[index].price)
                        ),
                      );
                    });
            }),
      
    ])));
  }
}

            
             /*
              PromoCard(
                image: 'assets/images/pixel.jpg',
                title: 'Google - Pixel 6 256GB (Unlocked) - Sorta Seafoam',
                modelTag: 'Model: GA03910-US',
                ratingPath: 'assets/icons/rating41.svg',
                price: 649.00,
                onTap: () {},
              ),
              PromoCard(
                image: 'assets/images/galaxy.jpg',
                title:
                    'Samsung - Galaxy S22 Ultra 128GB (Unlocked) - Phantom Black',
                modelTag: 'Model: SM-S908UZKAXAA',
                ratingPath: 'assets/icons/rating5.svg',
                price: 1199.99,
                onTap: () {
                  print()
                },
              ),
              PromoCard(
                image: 'assets/images/iphone.jpg',
                title:
                    'Apple - iPhone 13 Pro 5G 128GB - Alpine Green (Unlocked)',
                modelTag: 'Model: MNDT3LL/A',
                ratingPath: 'assets/icons/rating5.svg',
                price: 899.99,
                onTap: () {},
              ),*/