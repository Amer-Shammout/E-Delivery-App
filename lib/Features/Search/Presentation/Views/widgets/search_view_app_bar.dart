import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({
    super.key,
  });

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
            child: CustomIcon(
              icon: Assets.iconsBackArrow,
              iconSize: 12,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              radius: 32,
            ),
          ),
          const Expanded(
            child: CustomSearchBar(),
          ),
        ],
      ),
    );
  }
}
