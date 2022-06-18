import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<Navigation>(context);


    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Constants.primaryColorShadow,
      unselectedItemColor: Colors.black54,
      backgroundColor: Constants.backgroundGrayColor,
      currentIndex: nav.currentPage,
      onTap: (i) => nav.currentPage = i,
      items: const[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30),
          label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pin_drop,
            size: 30,),
          label: 'Locations'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30),
          label: 'Profile'),
      ],
    );
  }
}
