import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';

class _CustomBottomNavState extends State<CustomBottomNav>{

//const CustomBottomNav({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
   // final nav = Provider.of<Navigation>(context);


    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Constants.primaryColorShadow,
      unselectedItemColor: Colors.black54,
      backgroundColor: Constants.backgroundGrayColor,
      currentIndex: 0,
      onTap: (i) => {print(i)},
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

class CustomBottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomBottomNavState();
 
 


}
