import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.12,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.7, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, kSecondaryColor]),
          image: DecorationImage(
            image: AssetImage(Assets.imagesIphoneTest),
          ),
        ),
      ),
    );
  }
}
