import 'package:http/http.dart' as http;
import 'package:mutya_fake_store_api/models/api_response.dart';
import 'dart:convert';

import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<APIResponse<List<String>>> getAllCategories() {
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      final categories = <String>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var item in jsonData) {
          categories.add(item);
        }
      }
      return APIResponse<List<String>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<String>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<List<Product>> getAllProducts() async {
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      final product = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          product.add(Product.fromJson(product));
        }
      }
      return product;
    }).catchError((err) => print(err));
  }
}
