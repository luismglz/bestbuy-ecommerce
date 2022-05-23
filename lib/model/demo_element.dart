import 'package:best_buy/model/product.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'product.dart';
import 'package:short_uuids/short_uuids.dart';

var uuid = ShortUuid();

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

  static List<String> categoriesTitle = [
    'Cameras',
    'Audio',
    'Gaming',
    'Hardware',
    'Monitor',
    'Network',
    'Smartphones',
    'Printing',
  ];

  static Map<String, bool> isInOffer = {
    'Is In Offer?': true,
  };
}
