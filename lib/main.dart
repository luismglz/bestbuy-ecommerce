import 'dart:io';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/NavModel.dart';
import 'package:best_buy/presentation/screen/locations.dart';
import 'package:best_buy/presentation/screen/profile.dart';
import 'package:best_buy/presentation/widgets/customBottomNav0.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:best_buy/presentation/widgets/category_card.dart';
import 'package:best_buy/presentation/widgets/promo_card.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/presentation/widgets/list_section.dart';
import 'package:best_buy/presentation/widgets/cart.dart';
import 'package:best_buy/presentation/widgets/search_bar.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
  print(NavModel.selectedIndex);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    
    var index = NavModel.selectedIndex;

    List<Widget> screens = [
      const HomeScreen(),
      const Locations(),
      const Profile()
    ];
    //Set statusbar color
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Constants.primaryColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Best Buy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavModel.selectedIndex == 0 ? screens[0] : NavModel.selectedIndex == 1 ? screens[1]  : screens[2],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}












//Section in home screen with title and arrow icon











