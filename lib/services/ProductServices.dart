import 'package:http/http.dart' as http;
import 'package:best_buy/model/product.dart';
import 'dart:convert';

class ProductServices {
  Product? product;

  Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://10.0.2.2:3030/products/');
    var response = await http.get(url);

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();

    return products;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    var url = Uri.parse('http://10.0.2.2:3030/products/cat/$category');
    var response = await http.get(url);

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();

    return products;
  }

  Future<List<Product>> getProductsByTitle(String title) async {
    var url = Uri.parse('http://10.0.2.2:3030/products/$title');
    var response = await http.get(url);

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();

    return products;
  }

  Future<Product> addProduct(Product product) async {
    var responsePost = await http.post(
      Uri.parse('http://10.0.2.2:3030/products/new/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': product.title,
        'image': product.image,
        'modelTag': product.modelTag,
        'rating': product.rating,
        'category': product.category,
        'brand': product.brand,
        'price': product.price,
        'isPromo': product.isPromo,
      }),
    );

    if (responsePost.statusCode == 201) {
      return Product.fromJson(jsonDecode(responsePost.body));
    } else {
      throw Exception('Failed to add product');
    }
  }
}
