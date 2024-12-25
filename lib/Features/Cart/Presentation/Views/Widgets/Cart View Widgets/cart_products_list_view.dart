import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_slidable.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: kSpacing*6),
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: kSpacing*6),
        child: ProductSlidable(),
      ),
    );
  }
}
