import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class FavoriteProductsListView extends StatelessWidget {
  const FavoriteProductsListView({super.key, required this.favoriteProducts});
  final List<ProductModel> favoriteProducts;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
            bottom: kSpacing * 4,
            left: kHorizontalPadding,
            right: kHorizontalPadding),
        child: FavoriteProduct(
          product: favoriteProducts[index],
        ),
      ),
    );
  }
}
