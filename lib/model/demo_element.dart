import 'package:best_buy/model/product.dart';

import 'category.dart';
import 'product.dart';
import 'package:short_uuids/short_uuids.dart';

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

  static List<Product> products = [
    Product(
        id: '1a1a1a1a1a1a',
        image: 'assets/images/macbook.jpg',
        title:
            'MacBook Pro 14" Laptop - Apple M1 Pro chip - 16GB Memory - 512GB SSD (Latest Model) - Silver',
        modelTag: 'Model: MKGR3LL/A',
        rating: 50.0,
        category: 'Laptop',
        brand: 'Apple',
        price: 1749.00,
        isPromo: false)
  ];
}
