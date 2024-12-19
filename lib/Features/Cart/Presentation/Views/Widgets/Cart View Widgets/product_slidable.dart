import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_card_cart.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductSlidable extends StatelessWidget {
  const ProductSlidable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(child: ProductCardCart()),
      ],
    );
  }
}
