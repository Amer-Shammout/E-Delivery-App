import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        boxShadow: Shadows.innerShadow(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(
        Assets.iconsFilter,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.error, BlendMode.srcATop),
      ),
    );
  }
}
