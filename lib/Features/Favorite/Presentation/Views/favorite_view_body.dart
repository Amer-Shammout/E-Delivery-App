import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: StatusAppBar(),
        ),
        PinnedHeaderSliver(
          child: CustomSearchBar(
            isEnabled: false,
            onTap: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kSearchName,
              );
            },
          ),
        ),
        const FavoriteProductsListView(),
      ],
    );
  }
}
