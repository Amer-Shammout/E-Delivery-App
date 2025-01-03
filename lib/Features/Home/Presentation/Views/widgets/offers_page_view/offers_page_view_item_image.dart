import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OffersPageViewItemImage extends StatelessWidget {
  const OffersPageViewItemImage({
    super.key,
    required this.offerImage,
  });

  final String offerImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: kSpacing,
        bottom: kSpacing * 3,
        top: kSpacing * 3,
      ),
      child: Image.network(
        Assets.imagesIphoneTest,
      ),
    );
  }
}
