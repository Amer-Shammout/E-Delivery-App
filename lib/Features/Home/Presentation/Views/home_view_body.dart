import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_builder.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/categories_list_view_builder.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view_builder.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/products_grid_view_builder.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: StatusAppBarBuilder(),
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
        const SliverToBoxAdapter(
          child: OffersPageViewBuilder(),
        ),
        const PinnedHeaderSliver(
          child: CategoriesListViewBuilder(),
        ),
        const ProductsGridViewBuilder(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kSpacing * 4,
          ),
        ),
      ],
    );
  }
}
