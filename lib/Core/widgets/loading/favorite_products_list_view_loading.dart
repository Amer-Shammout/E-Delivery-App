import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class FavoriteProductsListViewLoading extends StatelessWidget {
  const FavoriteProductsListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
            bottom: kSpacing * 4,
            left: kHorizontalPadding,
            right: kHorizontalPadding),
        child: CustomContainer(
          child: Container(
            height: 124,
            padding: const EdgeInsets.only(
                left: kHorizontalPadding,
                right: kHorizontalPadding,
                top: kSpacing * 4,
                bottom: kSpacing * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                matchTextDirection: true,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
                fit: BoxFit.fill,
                image: const AssetImage(Assets.imagesFavoriteCard),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
