import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_content.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductViewContentWithScrollEffect extends StatelessWidget {
  const ProductViewContentWithScrollEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Expanded(
          child: ProductViewContent(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  kSecondaryColor.withOpacity(0.25),
                  kSecondaryColor.withOpacity(0.5),
                  kSecondaryColor.withOpacity(0.75),
                  kSecondaryColor,
                  kSecondaryColor,
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kSecondaryColor.withOpacity(0.25),
                  kSecondaryColor.withOpacity(0.5),
                  kSecondaryColor.withOpacity(0.75),
                  kSecondaryColor,
                  kSecondaryColor,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
