import 'package:e_delivery_app/Core/widgets/Custom%20Product/custom_product.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

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

  EdgeInsets formatPadding(int index) {
    return index % 2 == 0
        ? const EdgeInsets.only(left: 16)
        : const EdgeInsets.only(right: 16);
  }
}
