import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class ProductsResultsBody extends StatelessWidget {
  const ProductsResultsBody({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? CustomScrollView(
            slivers: [
              ProductsGridView(
                products: products,
              ),
            ],
          )
        : const Text("No Search Results");
  }

 
}
