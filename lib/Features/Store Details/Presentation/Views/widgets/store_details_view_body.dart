import 'package:e_delivery_app/Core/widgets/categories_list_view.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store%20details%20app%20bar/store_details_app_bar.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoreDetailsViewBody extends StatelessWidget {
  const StoreDetailsViewBody({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        StoreDetailsAppBar(
          storeModel: storeModel,
        ),
        PinnedHeaderSliver(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: const Column(
              children: [
                SizedBox(
                  height: kSpacing * 6,
                ),
                CategoriesListView(),
              ],
            ),
          ),
        ),
        const ProductsGridView(),
      ],
    );
  }
}
