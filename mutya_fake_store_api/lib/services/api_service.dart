import 'package:http/http.dart' as http;
import 'package:mutya_fake_store_api/models/cart.dart';
import 'dart:convert';

import 'package:mutya_fake_store_api/models/product.dart';
import 'package:mutya_fake_store_api/models/products.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-type': 'application/json'};

  Future login(String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(Uri.parse(baseUrl), body: body);
    return response.body;
  }

  Future<List<String>> getAllCategories() {
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      final categories = <String>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var item in jsonData) {
          categories.add(item);
        }
      }
      return categories;
    }).catchError((e) => print(e));
  }

  Future<List<Product>> getAllProducts() async {
    return http
        .get(Uri.parse('$baseUrl/products'), headers: headers)
        .then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((err) => print(err));
  }

  Future<Product> getProduct(int id) async {
    return http.get(Uri.parse('$baseUrl/products/$id')).then((data) {
      Product product = Product();
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        product = Product.fromJson(jsonData);
      }
      return product;
    }).catchError((err) => print(err));
  }

  Future<Cart?> getCart(String userId) async {
    return http.get(Uri.parse('$baseUrl/carts/$userId')).then((data) {
      Cart cart = Cart();
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        cart = Cart.fromJson(jsonData);
      }
      return cart;
    }).catchError((err) => print(err));
  }

  Future<bool> deleteCart(String id) async {
    return http.delete(Uri.parse('$baseUrl/carts/$id')).then((data) {
      if (data.statusCode == 204) {
        return true;
      }
      return false;
    }).catchError((err) => print(err));
  }
}
