import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_model.dart';
import 'widgets/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: RefreshIndicator(
        onRefresh: viewModel.fetchProducts,
        child: viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : viewModel.errorMessage != null
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(viewModel.errorMessage!),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: viewModel.fetchProducts,
                child: Text("Retry"),
              )
            ],
          ),
        )
            : ListView.builder(
          itemCount: viewModel.products.length,
          itemBuilder: (context, index) =>
              ProductItem(product: viewModel.products[index]),
        ),
      ),
    );
  }
}