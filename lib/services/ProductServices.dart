import 'package:http/http.dart' as http;
import 'package:best_buy/model/product.dart';
import 'dart:convert';
//import 'package:best_buy/services/products.json' as api;

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

}
