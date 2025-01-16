import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<SliverAnimatedListState> animatedKey = GlobalKey();

class FavoriteProductsListView extends StatelessWidget {
  const FavoriteProductsListView({super.key, required this.favoriteProducts});
  final List<ProductModel> favoriteProducts;
  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: animatedKey,
      initialItemCount: favoriteProducts.length,
      itemBuilder: (context, index, animation) => Padding(
        padding: const EdgeInsets.only(
            bottom: kSpacing * 4,
            left: kHorizontalPadding,
            right: kHorizontalPadding),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouter.kProductDetailsName,
                extra: favoriteProducts[index]);
          },
          child: SizeTransition(
            sizeFactor: animation,
            child: FavoriteProduct(
              product: favoriteProducts[index],
            ),
          ),
        ),
      ),
    );
  }
}
