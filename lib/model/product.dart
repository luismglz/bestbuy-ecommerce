import 'dart:ffi';

class Product{
  String? id;
  String? image;
  String? title;
  String? modelTag;
  double? rating;
  String? category;
  String? brand;
  double? price;
  Bool? isPromo;
  
  Product({
    this.id,
    this.image,
    this.title,
    this.modelTag,
    this.rating,
    this.category,
    this.brand,
    this.price,
    this.isPromo
  });
  
}