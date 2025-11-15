class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  String get name => title; // add this line

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title']?.toString() ?? 'Unknown Product',
      image: json['image']?.toString() ?? '',
      price: (json['price'] != null ? (json['price'] as num).toDouble() : 0.0),
    );
  }
}