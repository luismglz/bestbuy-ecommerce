import 'package:http/http.dart' as http;
import 'package:best_buy/model/product.dart';
import 'dart:convert';
//import 'package:best_buy/services/products.json' as api;

class ProductServices{
    Future<List<Product>> getProducts() async {
    var url = Uri.parse('https://mocki.io/v1/46187cfb-4d43-4459-864a-40adc3611fc8');
    var response = await http.get(url);

      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<Product> products =
          parsed.map<Product>((json) => Product.fromJson(json)).toList();

      return products;
    }
  }
