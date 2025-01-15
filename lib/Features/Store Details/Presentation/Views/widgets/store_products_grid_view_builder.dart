import 'package:e_delivery_app/Core/widgets/loading/products_grid_view_loading.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsGridViewBuilder extends StatefulWidget {
  const StoreProductsGridViewBuilder({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  State<StoreProductsGridViewBuilder> createState() =>
      _StoreProductsGridViewBuilderState();
}

class _StoreProductsGridViewBuilderState
    extends State<StoreProductsGridViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetStoreProductsCubit>(context)
        .getStoreProducts(storeId: widget.storeModel.id!, category: 'All'
            );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoreProductsCubit, GetStoreProductsState>(
      builder: (context, state) {
        if (state is GetStoreProductsSuccess) {
          // ignore: missing_required_param
          return ProductsGridView(
            products: state.products,
            getStoreProductsSuccess: state,
          );
        } else if (state is GetStoreProductsFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return const ProductsGridViewLoading();
        }
      },
    );
  }
}
