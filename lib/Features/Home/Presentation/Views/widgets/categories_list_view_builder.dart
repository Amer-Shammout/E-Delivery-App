import 'package:e_delivery_app/Core/widgets/categories_list_view.dart';
import 'package:e_delivery_app/Core/widgets/loading/categories_list_view_loading.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return CategoriesListView(categories: state.categories);
        } else if (state is GetCategoriesFailure) {
          return Text(state.errMessage);
        } else {
          return const CategoriesListViewLoading();
        }
      },
    );
  }
}
