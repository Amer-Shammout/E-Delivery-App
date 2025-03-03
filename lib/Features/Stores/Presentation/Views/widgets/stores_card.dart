import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class StoresCard extends StatelessWidget {
  const StoresCard(
      {super.key,
      required this.cardColor,
      @required this.storeLogo,
      this.opacity});

  final Color cardColor;
  final String? storeLogo;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomCardPattern(
        opacity: opacity ?? 1,
        cardColor: cardColor,
        child: SizedBox(
          height: 70,
          child: AspectRatio(
            aspectRatio: 200 / 65,
            child: storeLogo != null
                ? CachedNetworkImage(
                    imageUrl: storeLogo!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 24,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
