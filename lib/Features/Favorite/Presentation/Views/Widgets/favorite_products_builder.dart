import 'package:e_delivery_app/Core/widgets/loading/favorite_products_list_view_loading.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/empty_favorite_body.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteProductsBuilder extends StatelessWidget {
  const FavoriteProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteProductsCubit, GetFavoriteProductsState>(
      builder: (context, state) {
        if (state is GetFavoriteProductsSuccess) {
          return FavoriteProductsListView(
            favoriteProducts: state.favoriteProducts,
          );
        } else if (state is GetFavoriteProductsFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
          );
        } else if (state is GetFavoriteProductsEmpty) {
          return const SliverToBoxAdapter(
            child: EmptyFavoriteBody(),
          );
        } else {
          return const FavoriteProductsListViewLoading();
        }
      },
    );
  }
}
