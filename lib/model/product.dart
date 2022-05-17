import 'dart:ffi';

class Product {
  String? id;
  String? image;
  String? title;
  String? modelTag;
  double? rating;
  String? category;
  String? brand;
  double? price;
  bool? isPromo;

  Product(
      {this.id,
      this.image,
      this.title,
      this.modelTag,
      this.rating,
      this.category,
      this.brand,
      this.price,
      this.isPromo});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    modelTag = json['modelTag'];
    rating = json['rating'];
    category = json['category'];
    brand = json['brand'];
    price = json['price'];
    isPromo = json['isPromo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['modelTag'] = this.modelTag;
    data['rating'] = this.rating;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['isPromo'] = this.isPromo;
    return data;
  }
}
