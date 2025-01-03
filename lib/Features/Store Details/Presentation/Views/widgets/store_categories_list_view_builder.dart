import 'package:e_delivery_app/Core/widgets/loading/categories_list_view_loading.dart';
import 'package:e_delivery_app/Core/widgets/loading/my_app_loading_indicator.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store_categories_list_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_categories_cubit/get_store_categories_cubit.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCategoriesListViewBuilder extends StatefulWidget {
  const StoreCategoriesListViewBuilder({
    super.key,
    required this.storeModel,
  });

  final StoreModel storeModel;

  @override
  State<StoreCategoriesListViewBuilder> createState() =>
      _StoreCategoriesListViewBuilderState();
}

class _StoreCategoriesListViewBuilderState
    extends State<StoreCategoriesListViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetStoreCategoriesCubit>(context)
        .getStoreCategories(widget.storeModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoreCategoriesCubit, GetStoreCategoriesState>(
      builder: (context, state) {
        if (state is GetStoreCategoriesSuccess) {
          return StoreCategoriesListView(
            storeModel: widget.storeModel,
            storeCategories: state.storeCategories,
          );
        } else if (state is GetStoreCategoriesFailure) {
          return Text(state.errMessage);
        } else {
          return CategoriesListViewLoading();
        }
      },
    );
  }
}
