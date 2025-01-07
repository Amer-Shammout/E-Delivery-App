import 'package:e_delivery_app/Core/widgets/loading/products_grid_view_loading.dart';
import 'package:e_delivery_app/Core/widgets/loading/stores_list_view_loading.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchLoading extends StatelessWidget {
  const CustomSearchLoading({super.key, required this.searchType});

  final String searchType;

  @override
  Widget build(BuildContext context) {
    if (searchType == kAll) {
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kSpacing * 4,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: kHorizontalPadding,
                end: kHorizontalPadding,
                bottom: kSpacing * 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 80,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    height: 15,
                    width: 50,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  7,
                  (index) => Padding(
                    padding: formatPadding(index),
                    // ignore: missing_required_param
                    child: StoresCard(
                      cardColor: Theme.of(context).colorScheme.secondary,
                      opacity: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kSpacing * 4,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: kHorizontalPadding,
                end: kHorizontalPadding,
                bottom: kSpacing * 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 80,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    height: 15,
                    width: 50,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          const ProductsGridViewLoading(),
        ],
      );
    } else if (searchType == kStores) {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: CustomScrollView(
          slivers: [
            StoresListViewLoading(),
          ],
        ),
      );
    } else {
      return const CustomScrollView(
        slivers: [
          ProductsGridViewLoading(),
        ],
      );
    }
  }

  EdgeInsetsDirectional formatPadding(int index) {
    return EdgeInsetsDirectional.only(
        start: index == 0 ? kHorizontalPadding : 0,
        end: index == 6 ? kHorizontalPadding : 8);
  }
}
