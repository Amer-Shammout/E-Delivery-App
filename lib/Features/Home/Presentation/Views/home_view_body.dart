import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Core/widgets/categories_list_view.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
            onTap: (){
              GoRouter.of(context).push(AppRouter.kSearchView,);
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: OffersPageView(),
        ),
        const PinnedHeaderSliver(
          child: CategoriesListView(),
        ),
        const ProductsGridView(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kSpacing * 4,
          ),
        ),
      ],
    );
  }
}
