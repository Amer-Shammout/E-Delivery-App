import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCategoriesListView extends StatefulWidget {
  const StoreCategoriesListView(
      {super.key, required this.storeCategories, required this.storeModel});

  final List<dynamic> storeCategories;
  final StoreModel storeModel;

  @override
  State<StoreCategoriesListView> createState() =>
      _StoreCategoriesListViewState();
}

class _StoreCategoriesListViewState extends State<StoreCategoriesListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Theme.of(context).colorScheme.surface,
      height: 57,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.storeCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: formatPadding(index),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              BlocProvider.of<GetStoreProductsCubit>(context).getStoreProducts(
                  storeId: widget.storeModel.id!,
                  category: widget.storeCategories[index]);
            },
            child: currentIndex == index
                ? CustomWidgetWithDash(
                    dashColor: Theme.of(context).colorScheme.primary,
                    height: 4,
                    width: 40,
                    widget: Text(widget.storeCategories[index],
                        style: AppStyles.fontsBold16(context).copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  )
                : Text(
                    widget.storeCategories[index],
                    style: AppStyles.fontsMedium16(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  EdgeInsetsGeometry formatPadding(int index) {
    return index == 0
        ? const EdgeInsetsDirectional.only(start: 16, end: 8)
        : index == 9
            ? const EdgeInsetsDirectional.only(end: 16, start: 8)
            : const EdgeInsets.symmetric(horizontal: 8);
  }
}
