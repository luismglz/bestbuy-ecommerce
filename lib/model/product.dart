import 'dart:ffi';

class Product {
  int? id;
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
    rating = json['rating'].toDouble();
    category = json['category'];
    brand = json['brand'];
    price = json['price'].toDouble();
    isPromo = json['isPromo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['modelTag'] = modelTag;
    data['rating'] = rating;
    data['category'] = category;
    data['brand'] = brand;
    data['price'] = price;
    data['isPromo'] = isPromo;
    print(data);
    return data;
  }
}
