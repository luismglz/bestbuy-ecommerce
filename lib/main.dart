import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:best_buy/presentation/widget/category_card.dart';
import 'package:best_buy/presentation/widget/promo_card.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/presentation/widget/list_section.dart';
import 'package:best_buy/presentation/widget/cart.dart';
import 'package:best_buy/presentation/widget/search_bar.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set statusbar color
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Constants.primaryColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Best Buy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}










//Section in home screen with title and arrow icon











