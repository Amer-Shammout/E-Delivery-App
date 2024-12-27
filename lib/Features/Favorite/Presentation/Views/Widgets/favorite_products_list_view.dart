import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class FavoriteProductsListView extends StatelessWidget {
  const FavoriteProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(
            bottom: kSpacing * 6,
            left: kHorizontalPadding,
            right: kHorizontalPadding),
        child: FavoriteProduct(),
      ),
    );
  }
}
