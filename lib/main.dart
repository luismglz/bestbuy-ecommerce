import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

const primaryColor = Color.fromRGBO(0, 70, 190, 1.0);
const secondaryColor = Color.fromRGBO(255, 241, 0, 1.0);

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
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Expanded(
              child: ListView(
            children: [
              PromoCard(
                image: 'assets/images/macbook.jpg',
                title:
                    'MacBook Pro 14" Laptop - Apple M1 Pro chip - 16GB Memory - 512GB SSD (Latest Model) - Silver',
                modelTag: 'Model: MKGR3LL/A',
                ratingPath: 'assets/icons/rating5.svg',
                price: 1749.00,
                onTap: () {},
              ),
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
                onTap: () {},
              ),
              PromoCard(
                image: 'assets/images/iphone.jpg',
                title:
                    'Apple - iPhone 13 Pro 5G 128GB - Alpine Green (Unlocked)',
                modelTag: 'Model: MNDT3LL/A',
                ratingPath: 'assets/icons/rating5.svg',
                price: 899.99,
                onTap: () {},
              ),
            ],
          ))
        ],
      )),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 70, 190, 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(),
              child: Image.network(
                  'https://1000marcas.net/wp-content/uploads/2020/05/logo-Best-Buy.png',
                  height: 75)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top deals',
                style: TextStyle(
                    fontSize: 20.0,
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Cart(numberOfItemsInCart: DemoElement.numberOfItemsInCart),
            ],
            //simulando que hay items en carrito de compra
          ),
          Row(
            children: const [
              Text('Enjoy a safe, convenient shopping experience',
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 2,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.start),
            ],
          ),
          Row(
            children: const [],
          ),
          SearchBar()
        ],
      ),
    );
  }
}

class Cart extends StatelessWidget {
  final int numberOfItemsInCart;

  const Cart({Key? key, required this.numberOfItemsInCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //reemplazar overflow con clipBehavior
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          child: SvgPicture.network(
              'https://www.bestbuy.com/~assets/bby/_com/shop/cart-icon/dist/client/images/066a3c85f1c275de42889e546accc7b6.svg'),
        ),
        //If items is minor than 0 circle of cart does not displayed
        if (numberOfItemsInCart > 0)
          Positioned(
              top: -4.0,
              right: -4.0,
              child: Container(
                width: 12.0,
                height: 12.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: secondaryColor, width: 1.0)),
                child: Text(
                  '$numberOfItemsInCart',
                  style: const TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 28.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              offset: const Offset(0.0, 1.0),
              blurRadius: 50,
            )
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
          decoration: const InputDecoration(
        icon: Icon(Icons.search, color: primaryColor),
        hintText: 'What are you looking for?...',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
      )),
    );
  }
}


//Section in home screen with title and arrow icon
class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Section(this.title, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 19.0, height: 1, fontWeight: FontWeight.w600),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1,
                        color: primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.arrow_forward, color: primaryColor),
                    )
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 15.0,
                children: children,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ListSection extends StatelessWidget {
  final String title;

  const ListSection(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 19.0, height: 1, fontWeight: FontWeight.w600),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1,
                        color: primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.arrow_forward, color: primaryColor),
                    )
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 130,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            offset: Offset.zero,
            blurRadius: 12.0,
          )
        ]),
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                child: Image.asset(
                  iconPath,
                  color: primaryColor,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String image;
  final String title;
  final String modelTag;
  final String ratingPath;
  final double price;
  final Function() onTap;


//Create class for
  const PromoCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.modelTag,
      required this.ratingPath,
      required this.price,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 400,
          width: 100,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset.zero,
              blurRadius: 14.0,
            )
          ]),
          child: Center(
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            image,
                          )),
                    ),
                    Container(
                      height: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40,top: 40),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17.0,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 22, left: 20),
                          child: Text(
                            modelTag,
                            style: const TextStyle(
                              fontSize: 11
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 22, left: 100),
                          child: Text(
                            price.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  ],
                )
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  String iconPath;
  String title;

  Category(this.iconPath, this.title);
}

class DemoElement {
  static int numberOfItemsInCart = 4;

  static List<Category> categories = [
    Category('assets/icons/camera.png', 'Cameras'),
    Category('assets/icons/audio.png', 'Audio'),
    Category('assets/icons/consoles.png', 'Gaming'),
    Category('assets/icons/hardware.png', 'Hardware'),
    Category('assets/icons/monitor.png', 'Monitor'),
    Category('assets/icons/network.png', 'Network'),
    Category('assets/icons/phone.png', 'Smartphones'),
    Category('assets/icons/printing.png', 'Printing'),
  ];
}
