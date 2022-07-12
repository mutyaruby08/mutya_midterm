class Product {
  int? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
