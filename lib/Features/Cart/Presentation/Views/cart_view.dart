import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_products_list_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartProductsListView(),
    );
  }
}