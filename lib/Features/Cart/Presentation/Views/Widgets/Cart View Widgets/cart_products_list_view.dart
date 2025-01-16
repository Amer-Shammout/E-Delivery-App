import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_slidable.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: kSpacing * 6),
      itemCount: cartModel.orderItems!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.only(bottom: kSpacing * 6),
        child: ProductSlidable(orderItem: cartModel.orderItems![index]),
      ),
    );
  }
}
