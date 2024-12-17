import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCardPattern extends StatelessWidget {
  const CustomCardPattern({
    super.key,
    required this.cardColor,
    this.margin = 0, required this.child,
  });

  final Color cardColor;
  final double margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: cardColor.withOpacity(.2),
        image: const DecorationImage(
          image: AssetImage(
            Assets.imagesCardBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
