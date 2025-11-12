import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final double price;
  final VoidCallback onTap;

  const FoodCard({
    required this.name,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 3,
      child: ListTile(
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('৳${price.toStringAsFixed(0)}'),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart, color: Colors.orange),
          onPressed: onTap,
        ),
      ),
    );
  }
}
