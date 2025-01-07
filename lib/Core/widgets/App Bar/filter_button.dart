import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.onSelected,
  });

  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    var popMenuItems = [
      PopupMenuItem(
        value: kAll,
        child: Text(
          'All',
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      PopupMenuItem(
        value: kProducts,
        child: Text(
          'Products',
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      PopupMenuItem(
        value: kStores,
        child: Text(
          'Stores',
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        boxShadow: Shadows.innerShadow(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: PopupMenuButton(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        itemBuilder: (context) => List.generate(
          popMenuItems.length,
          (index) {
            return popMenuItems[index];
          },
        ),
        onSelected: onSelected,
        child: SvgPicture.asset(
          Assets.iconsFilter,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.error, BlendMode.srcATop),
        ),
      ),
    );
  }
}
