import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_operation_details.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/stores_horizontal_list_view.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllResultsBody extends StatelessWidget {
  const AllResultsBody({super.key, required this.searchModel});

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return ((searchModel.products.isNotEmpty) || searchModel.stores.isNotEmpty)
        ? CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchOperationDetails(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                      AppRouter.kAllStoresName,
                      extra: searchModel.stores,
                    );
                  },
                  title: S.of(context).stores,
                ),
              ),
              SliverToBoxAdapter(
                child: StoresHorizontalListView(stores: searchModel.stores),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: kSpacing * 4,
                ),
              ),
              SliverToBoxAdapter(
                child: SearchOperationDetails(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(AppRouter.kAllProductsName,
                        extra: searchModel.products);
                  },
                  title: S.of(context).products,
                ),
              ),
              ProductsGridView(
                products: searchModel.products,
                length: setLength(searchModel.products.length),
              ),
            ],
          )
        : const Text("No search results");
  }

  int setLength(int length) {
    if (length != 0) {
      if (length >= 6) {
        return 6;
      }
      if (length == 5) {
        return 5;
      }
      if (length == 4) {
        return 4;
      }
      if (length == 3) {
        return 3;
      }
      if (length == 2) {
        return 2;
      }
      if (length == 1) {
        return 1;
      }
    }
    return 0;
  }
}
