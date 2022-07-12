class Cart {
  int? id;
  int? userId;
  DateTime? date;
  List<dynamic>? products;

  Cart({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "userId": userId, "date": date, "products": products};
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: json['products'],
    );
  }
}
