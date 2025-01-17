import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_slidable.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

final GlobalKey<AnimatedListState> cartAnimatedKey = GlobalKey();

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: cartAnimatedKey,
      padding: const EdgeInsets.only(top: kSpacing * 6, bottom: 300),
      initialItemCount: cartModel.orderItems!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) => FadeTransition(
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: kSpacing * 6),
          child: ProductSlidable(
              orderItem: cartModel.orderItems![index], index: index),
        ),
      ),
    );
  }
}
