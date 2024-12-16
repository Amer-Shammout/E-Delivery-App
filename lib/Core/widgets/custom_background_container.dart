import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer(
      {super.key, required this.child, this.image = Assets.imagesPattern, this.color = Colors.white});

  final Widget child;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
