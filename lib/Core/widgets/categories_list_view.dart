import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key, @required this.categories});

  final List<dynamic>? categories;

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
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: formatPadding(index),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: CustomWidgetWithDash(
              dashColor: formatColor(index, currentIndex),
              height: 4,
              width: 40,
              widget:
                  Text('Mobiles', style: formatTextStyle(index, currentIndex)),
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

  Color formatColor(int index, int currentIndex) {
    if (currentIndex != index) {
      return Colors.transparent;
    }
    return Theme.of(context).colorScheme.primary;
  }

  TextStyle formatTextStyle(int index, int currentIndex) {
    if (currentIndex != index) {
      return AppStyles.fontsMedium16(context).copyWith(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      );
    }
    return AppStyles.fontsBold16(context)
        .copyWith(color: Theme.of(context).colorScheme.primary);
  }
}
