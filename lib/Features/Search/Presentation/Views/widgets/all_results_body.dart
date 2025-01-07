import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/stores_horizontal_list_view.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class AllResultsBody extends StatelessWidget {
  const AllResultsBody({super.key, this.searchModel});

  final SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return !((searchModel!.products!.isEmpty) && searchModel!.stores!.isEmpty)
        ? CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: StoresHorizontalListView(searchModel: searchModel),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: kSpacing * 4,
                ),
              ),
              ProductsGridView(products: searchModel?.products),
            ],
          )
        : const Text("No search results");
  }
}
