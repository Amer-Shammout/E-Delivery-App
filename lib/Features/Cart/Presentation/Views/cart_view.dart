import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_products_list_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_app_bar.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomCartAppBar(),
      body: CartProductsListView(cartModel: cartModel),
    );
  }
}
