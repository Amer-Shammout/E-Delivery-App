import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_body.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
    this.onSelected,
  });

  final void Function(String)? onSelected;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    var popMenuItems = [
      PopupMenuItem(
        onTap: () {
          setState(() {});
        },
        value: kAll,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).all,
              style: AppStyles.fontsRegular16(context).copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            searchType == kAll
                ? const Icon(
                    Icons.check,
                    size: 16,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: () {
          setState(() {});
        },
        value: kProducts,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).products,
              style: AppStyles.fontsRegular16(context).copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            searchType == kProducts
                ? const Icon(
                    Icons.check,
                    size: 16,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: () {
          setState(() {});
        },
        value: kStores,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).stores,
              style: AppStyles.fontsRegular16(context).copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            searchType == kStores
                ? const Icon(
                    Icons.check,
                    size: 16,
                  )
                : const SizedBox.shrink(),
          ],
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
        onSelected: widget.onSelected,
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
