import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<SliverAnimatedListState> animatedKey = GlobalKey();

class FavoriteProductsListView extends StatefulWidget {
  const FavoriteProductsListView({super.key, required this.favoriteProducts});
  final List<ProductModel> favoriteProducts;

  @override
  State<FavoriteProductsListView> createState() =>
      _FavoriteProductsListViewState();
}

class _FavoriteProductsListViewState extends State<FavoriteProductsListView> {
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<GetFavoriteProductsCubit>(context).products.isEmpty) {
      BlocProvider.of<GetFavoriteProductsCubit>(context).emitEmptyFavorite();
    }
  }

  @override
  void dispose() {
    animatedKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: animatedKey,
      initialItemCount: widget.favoriteProducts.length,
      itemBuilder: (context, index, animation) => Padding(
        padding: const EdgeInsets.only(
            bottom: kSpacing * 4,
            left: kHorizontalPadding,
            right: kHorizontalPadding),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouter.kProductDetailsName,
                extra: widget.favoriteProducts[index]);
          },
          child: SizeTransition(
            sizeFactor: animation,
            child: FavoriteProduct(
              product: widget.favoriteProducts[index],
            ),
          ),
        ),
      ),
    );
  }
}
