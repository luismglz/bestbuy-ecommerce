import 'package:http/http.dart' as http;
import 'package:best_buy/model/product.dart';
import 'dart:convert';
//import 'package:best_buy/services/products.json' as api;

class ProductServices {

  Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://127.0.0.1:8000/api/product/');
    var response = await http.get(url);

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

     //print(parsed);
    List<Product> products = parsed.map<Product>((json) => Product.fromJson(json)).toList();

    print(products.toString());
    return products;
  }

}
