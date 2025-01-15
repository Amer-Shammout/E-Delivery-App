import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({
    super.key,
    this.searchSuccess,
  });
  final SearchSuccess? searchSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: S.of(context).all_products),
      body: CustomScrollView(
        slivers: [
          // ignore: missing_required_param
          ProductsGridView(
            products: searchSuccess!.searchModel.products,
            getSearchProductsSuccess: searchSuccess,
          ),
        ],
      ),
    );
  }
}
