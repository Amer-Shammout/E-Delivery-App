import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/custom_product.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, @required this.products});

  final List<ProductModel>? products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: formatPadding(index),
        child: const CustomProduct(),
      ),
    );
  }

  EdgeInsetsGeometry formatPadding(int index) {
    return index % 2 == 0
        ? const EdgeInsetsDirectional.only(start: 16)
        : const EdgeInsetsDirectional.only(end: 16);
  }
}
