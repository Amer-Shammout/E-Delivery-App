import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductImageMask extends StatelessWidget {
  const ProductImageMask({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(Assets.imagesIphoneTest),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [
                0.8,
                0.8,
                0.8,
                0.8,
                0.85,
                0.9,
                0.95,
                1,
                1,
                1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                kSecondaryColor.withOpacity(0.01),
                kSecondaryColor.withOpacity(0.15),
                kSecondaryColor.withOpacity(0.5),
                kSecondaryColor.withOpacity(0.75),
                kSecondaryColor,
                kSecondaryColor,
                kSecondaryColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
