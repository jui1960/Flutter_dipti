import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/food_model.dart';
import '../widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<FoodModel> foods = [];

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  Future<void> _loadFoods() async {
    final data = await dbHelper.getFoods();
    if (data.isEmpty) {
      await dbHelper.insertFood(FoodModel(name: 'Burger', price: 120));
      await dbHelper.insertFood(FoodModel(name: 'Pizza', price: 220));
      await dbHelper.insertFood(FoodModel(name: 'Fried Rice', price: 150));
    }
    final updated = await dbHelper.getFoods();
    setState(() {
      foods = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Canteen')),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final item = foods[index];
          return FoodCard(
            name: item.name,
            price: item.price,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} added to cart!')),
              );
            },
          );
        },
      ),
    );
  }
}
