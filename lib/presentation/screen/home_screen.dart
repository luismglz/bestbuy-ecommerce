import 'package:another_flushbar/flushbar.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/screen/add_product.dart';
import 'package:best_buy/presentation/widgets/navigation_drawer.dart';
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
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Product? product;
  ProductServices productServices = ProductServices();
  bool isLoading = true;

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom:30),
          child: FloatingActionButton(
            backgroundColor: Constants.secondaryColor,
            elevation: 1,
            
            child: Icon(
              Icons.add,
              color: Constants.primaryColor),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AddProduct()));
            },
          ),
        ),
        drawer: NavigationDrawerWidget(),
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
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Image.network(
                                "https://cdn1.iconfinder.com/data/icons/computer-techologies-outline-part-2/128/ic_failed_document-512.png",
                                height: 60),
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
      ])),
      
      );
  }
}

