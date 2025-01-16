import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_cart_content.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductCardCart extends StatelessWidget {
  const ProductCardCart(
      {super.key, required this.orderItem, required this.index});

  final OrderItem orderItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 132,
        padding: const EdgeInsets.only(
            left: kSpacing * 3,
            right: kSpacing * 3,
            top: kSpacing * 2,
            bottom: kSpacing),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            matchTextDirection: true,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
            fit: BoxFit.fill,
            image: const AssetImage(
              Assets.imagesCartCard,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: AspectRatio(
                aspectRatio: 0.8,
                child: CachedNetworkImage(
                    imageUrl: orderItem.productDetails!.imageUrl!),
              ),
            ),
            const SizedBox(
              width: kSpacing * 2,
            ),
            ProductCartContent(orderItem: orderItem, index: index),
          ],
        ),
      ),
    );
  }
}
