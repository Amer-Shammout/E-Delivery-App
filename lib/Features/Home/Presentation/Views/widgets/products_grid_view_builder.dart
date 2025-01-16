import 'package:e_delivery_app/Core/widgets/loading/products_grid_view_loading.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridViewBuilder extends StatelessWidget {
  const ProductsGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsByCategoryCubit, GetProductsByCategoryState>(
      builder: (context, state) {
        if (state is GetProductsByCategorySuccess) {
          // ignore: missing_required_param
          return ProductsGridView(
            products: state.products,
            getProductsSuccess: state,
          );
        } else if (state is GetProductsByCategoryFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return const ProductsGridViewLoading();
        }
      },
    );
  }
}
