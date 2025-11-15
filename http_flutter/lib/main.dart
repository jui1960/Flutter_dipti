import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'services/api_service.dart';
import 'viewmodels/product_view_model.dart';
import 'views/product_screen.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(apiService: ApiService())..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Name_ID_REST01',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductScreen(),
      ),
    );
  }
}