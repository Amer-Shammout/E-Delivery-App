import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

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

  EdgeInsets formatPadding(int index) {
    return index == 0
        ? const EdgeInsets.only(left: 16, right: 8)
        : index == 9
            ? const EdgeInsets.only(right: 16, left: 8)
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
      return FontStyles.fontsMedium16(context).copyWith(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      );
    }
    return FontStyles.fontsBold16(context)
        .copyWith(color: Theme.of(context).colorScheme.primary);
  }
}
