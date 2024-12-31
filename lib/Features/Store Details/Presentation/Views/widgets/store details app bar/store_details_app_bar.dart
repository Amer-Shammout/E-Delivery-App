import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store%20details%20app%20bar/store_details_app_bar_flexible_space.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreDetailsAppBar extends StatelessWidget {
  const StoreDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 65,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      floating: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: kHorizontalPadding,
          top: kHorizontalPadding,
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
            child: CustomIcon(
              icon: Assets.iconsBackArrow,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: kHorizontalPadding,
            top: 16,
          ),
          child: CustomIcon(
            icon: Assets.iconsCart,
          ),
        ),
      ],
      expandedHeight: 200,
      flexibleSpace: const StoreDetailsAppBarFlexibleSpace(),
    );
  }
}
