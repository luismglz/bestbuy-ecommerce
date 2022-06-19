import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';
import 'package:best_buy/presentation/screen/locations.dart';
import 'package:best_buy/presentation/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new NavModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: CustomBottomNav(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigation = Provider.of<NavModel>(context);

    return PageView(
      controller: navigation.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeScreen(),
        Locations(),
        Profile(),
      ],
    );
  }
}

class NavModel with ChangeNotifier{

int _currentPage = 0;

PageController _pageController = new PageController();

int get currentPage => this._currentPage;

set currentPage(int value){
  this._currentPage = value;

  _pageController.animateToPage(
    value, 
    duration: Duration(milliseconds: 250), 
    curve: Curves.easeInOut
    );
  notifyListeners();
}
PageController get pageController => this._pageController;

}

class _CustomBottomNavState extends State<CustomBottomNav> {
//const CustomBottomNav({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavModel>(context);

    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Constants.primaryColorShadow,
      unselectedItemColor: Colors.black54,
      backgroundColor: Constants.backgroundGrayColor,
      currentIndex: nav.currentPage,
      onTap: (i) => nav.currentPage = i,
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
    );
  }
}

class CustomBottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomBottomNavState();
}
