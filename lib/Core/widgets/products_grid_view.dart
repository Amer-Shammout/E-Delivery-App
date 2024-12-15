import 'package:e_delivery_app/Core/widgets/Custom%20Product/custom_product.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16),
      itemBuilder: (BuildContext context, int index) => const CustomProduct(),
    );
  }
}
