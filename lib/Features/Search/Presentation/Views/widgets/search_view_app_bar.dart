import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({
    super.key,
    this.onSelected,
    this.onChanged,
  });

  final void Function(String)? onSelected;
  final dynamic Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: kHorizontalPadding,
        top: kSpacing,
      ),
      child: Row(
        children: [
          Center(
            child: RotatedBox(
              quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
              child: CustomIcon(
                icon: Assets.iconsBackArrow,
                iconSize: 12,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                radius: 32,
              ),
            ),
          ),
          Expanded(
            child: CustomSearchBar(
              onChanged: onChanged,
              onSelected: onSelected,
            ),
          ),
        ],
      ),
    );
  }
}
