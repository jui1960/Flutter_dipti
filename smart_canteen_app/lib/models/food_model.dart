class FoodModel {
  final int? id;
  final String name;
  final double price;
  final String? image;

  FoodModel({this.id, required this.name, required this.price, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }
}
