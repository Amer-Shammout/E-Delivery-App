import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCardPattern extends StatelessWidget {
  const CustomCardPattern({
    super.key,
    required this.cardColor,
    this.margin = 0,
    required this.child,
    required this.opacity,
  });

  final Color cardColor;
  final double margin;
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: cardColor.withOpacity(.2),
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage(
            Assets.imagesCardBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
