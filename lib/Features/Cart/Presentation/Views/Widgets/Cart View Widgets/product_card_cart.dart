import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_cart_content.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductCardCart extends StatelessWidget {
  const ProductCardCart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 132,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.imagesCartCard),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.asset(Assets.imagesIphoneTest),
              ),
            ),
            const SizedBox(
              width: kSpacing * 2,
            ),
            const ProductCartContent(),
          ],
        ),
      ),
    );
  }
}
