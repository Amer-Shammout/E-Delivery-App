import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:flutter/material.dart';

class FavoriteProductsListView extends StatelessWidget {
  const FavoriteProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: FavoriteProduct(),
      ),
    );
  }
}
