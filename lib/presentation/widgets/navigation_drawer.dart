import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:best_buy/presentation/screen/add_product.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        
        children: [
           UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Constants.primaryColor
            ),    
            arrowColor: Constants.primaryColor,
            accountName: Text(
              'Luis Mario',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold)
              )),
            accountEmail: const Text('lmgl8@outlook.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(
                
                size: 42.0,
              ),
            ),
          ),
          Ink(
            color: Colors.white10,
            child: ListTile(
              leading: const Icon(
                Icons.add,
                color: Constants.primaryColor,
              ),
              title: const Text(
                'Add product',
                style: TextStyle(color: Constants.primaryColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AddProduct()));
              },
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
