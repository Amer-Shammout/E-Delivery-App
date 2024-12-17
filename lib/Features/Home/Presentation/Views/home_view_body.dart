import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Core/widgets/categories_list_view.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/offers_page_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: StatusAppBar(),
          ),
          PinnedHeaderSliver(
            child: CustomSearchBar(),
          ),
          SliverToBoxAdapter(
            child: OffersPageView(),
          ),
          PinnedHeaderSliver(
            child: CategoriesListView(),
          ),
          ProductsGridView(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: kSpacing * 4,
            ),
          ),
        ],
      ),
    );
  }
}
