import 'dart:developer';

import 'package:e_delivery_app/Core/widgets/my_app_loading_indicator.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store_details_view_body.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_categories_cubit/get_store_categories_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsViewBodyBuilder extends StatefulWidget {
  const StoreDetailsViewBodyBuilder({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  State<StoreDetailsViewBodyBuilder> createState() =>
      _StoreDetailsViewBodyBuilderState();
}

class _StoreDetailsViewBodyBuilderState
    extends State<StoreDetailsViewBodyBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetStoreCategoriesCubit>(context)
        .getStoreCategories(widget.storeModel.id!);
    BlocProvider.of<GetStoreProductsCubit>(context)
        .getStoreProducts(storeId: widget.storeModel.id!, category: 'sit');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoreCategoriesCubit, GetStoreCategoriesState>(
      builder: (context, state1) {
        return BlocBuilder<GetStoreProductsCubit, GetStoreProductsState>(
          builder: (context, state2) {
            final isSuccess = state1 is GetStoreCategoriesSuccess &&
                state2 is GetStoreProductsSuccess;
            if (isSuccess) {
              log("${state1.storeCategories}\n${state2.products}");
              return StoreDetailsViewBody(
                storeModel: widget.storeModel,
                state1: state1,
                state2: state2,
              );
            } else if (state1 is GetStoreCategoriesFailure) {
              return Text(state1.errMessage);
            } else if (state2 is GetStoreProductsFailure) {
              return Text(state2.errMessage);
            } else {
              return Center(
                child: myAppLottieIndicator(context),
              );
            }
          },
        );
      },
    );
  }
}
