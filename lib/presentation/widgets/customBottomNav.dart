import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/NavModel.dart';
import 'package:best_buy/presentation/widgets/icon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    // NavModel nav = new NavModel();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.transparent),
      child: BottomAppBar(
        child: SizedBox(
          height: 56,
          child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconBottomBar(
                      text: "Home",
                      icon: Icons.home_filled,
                      selected: NavModel.selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          NavModel.selectedIndex = 0;
                        });
                        print(NavModel.selectedIndex);
                      }),
                  IconBottomBar(
                      text: "Locations",
                      icon: Icons.location_on_outlined,
                      selected: NavModel.selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          NavModel.selectedIndex = 1;
                        });
                        print(NavModel.selectedIndex);
                      }),
                  IconBottomBar(
                      text: "Profile",
                      icon: Icons.person_outline_outlined,
                      selected: NavModel.selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          NavModel.selectedIndex = 2;
                        });
                        print(NavModel.selectedIndex);
                      })
                ],
              )),
        ),
      ),
    );
  }
}

/*

BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Constants.primaryColorShadow,
      unselectedItemColor: Colors.black54,
      backgroundColor: Constants.backgroundGrayColor,
      currentIndex: 0,
      onTap: (i) => {print(i)},
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.pin_drop,
              size: 30,
            ),
            label: 'Locations'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), label: 'Profile'),
      ],
    ); */