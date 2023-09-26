class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}
class NewProduct {
  final String name;
  final double price;

  NewProduct({required this.name, required this.price});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}