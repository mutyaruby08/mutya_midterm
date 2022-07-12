import 'package:mutya_fake_store_api/models/products.dart';

class Cart {
  int id;
  int userId;
  DateTime date;
  List<Products> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
}
