import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

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
    }).catchError((err) => print(err));
  }
}
