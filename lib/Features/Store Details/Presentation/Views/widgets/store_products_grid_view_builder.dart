import 'package:e_delivery_app/Core/widgets/my_app_loading_indicator.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsGridViewBuilder extends StatefulWidget {
  const StoreProductsGridViewBuilder({
    super.key
  });


  @override
  State<StoreProductsGridViewBuilder> createState() =>
      _StoreProductsGridViewBuilderState();
}

class _StoreProductsGridViewBuilderState
    extends State<StoreProductsGridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoreProductsCubit, GetStoreProductsState>(
      builder: (context, state) {
        if (state is GetStoreProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is GetStoreProductsFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return SliverFillRemaining(
            child: Center(
              child: myAppLottieIndicator(context),
            ),
          );
        }
      },
    );
  }
}