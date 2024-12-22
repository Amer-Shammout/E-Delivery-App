import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductIconContent extends StatelessWidget {
  const CustomProductIconContent(
      {super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration:
              const BoxDecoration(boxShadow: [Shadows.iconContentDropShadow]),
          child: SvgPicture.asset(
            width: 24,
            height: 24,
            icon,
            colorFilter:
                 ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcATop),
          ),
        ),
        const SizedBox(
          width: kSpacing,
        ),
        Text(
          '$text.',
          style: AppStyles.fontsSemiBold12(context)
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
