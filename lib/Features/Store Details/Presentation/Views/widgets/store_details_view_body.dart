import 'package:e_delivery_app/Core/widgets/categories_list_view.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store%20details%20app%20bar/store_details_app_bar.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_categories_cubit/get_store_categories_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoreDetailsViewBody extends StatelessWidget {
  const StoreDetailsViewBody({
    super.key,
    required this.storeModel,
    required this.state1,
    required this.state2,
  });

  final StoreModel storeModel;
  final GetStoreCategoriesSuccess state1;
  final GetStoreProductsSuccess state2;

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
            child: Column(
              children: [
                const SizedBox(
                  height: kSpacing * 6,
                ),
                CategoriesListView(
                  categories: state1.storeCategories,
                ),
              ],
            ),
          ),
        ),
        ProductsGridView(
          products: state2.products,
        )
      ],
    );
  }
}
