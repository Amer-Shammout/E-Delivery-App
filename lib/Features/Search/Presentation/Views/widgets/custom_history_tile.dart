import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHistoryTile extends StatelessWidget {
  const CustomHistoryTile(
      {super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TileTemplate(
      tile: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: kSpacing * 4),
        title: Text(
          title,
          style: FontStyles.fontsMedium16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        leading: SvgPicture.asset(
          Assets.iconsHistory,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.error,
            BlendMode.srcATop,
          ),
        ),
        trailing: SvgPicture.asset(
          Assets.iconsButtonsArrow,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.error,
            BlendMode.srcATop,
          ),
        ),
      ),
    );
  }
}
