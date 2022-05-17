import 'package:best_buy/model/product.dart';
import 'package:flutter/material.dart';
import 'package:best_buy/presentation/widgets/category_card.dart';
import 'package:best_buy/presentation/widgets/header.dart';
import 'package:best_buy/presentation/widgets/section.dart';
import 'package:best_buy/presentation/widgets/category_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(),
          Section(
            'Categories',
            DemoElement.categories.map((category) {
              return CategoryCard(
                  title: category.title,
                  iconPath: category.iconPath,
                  onTap: () {});
            }).toList(),
          ),
          const ListSection(
            'Today\'s popular picks',
          ),
          Container(
              child: ListView(
            children: [
              <Widget>[
            DemoElement.products.map((product) {
              return PromoCard(
                product: Product(
                  id: product.id,
                  image: product.image,
                  title: product.title,
                  modelTag: product.modelTag!,
                  rating: product.rating,
                  brand: product.brand,
                  price: product.price,
                  isPromo: product.isPromo
                ),
                  onTap: () {});
            }).toList(),
            ];

            ],
          ),
      ))
    ));
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