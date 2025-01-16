import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<dynamic> categories;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
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
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: formatPadding(index),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              debugPrint("${Prefs.getString(kToken)}");
              BlocProvider.of<GetProductsByCategoryCubit>(context)
                  .getProductsByCategory(widget.categories[index]);
              setState(() {});
            },
            child: currentIndex == index
                ? CustomWidgetWithDash(
                    dashColor: Theme.of(context).colorScheme.primary,
                    height: 4,
                    width: 40,
                    widget: Text(widget.categories[index],
                        style: AppStyles.fontsBold16(context).copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  )
                : Text(
                    widget.categories[index],
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
