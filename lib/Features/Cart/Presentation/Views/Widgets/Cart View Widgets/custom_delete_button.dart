import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                width: 40,
                height: 40,
                Assets.iconsTrash,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcATop,
                ),
              ),
              const SizedBox(
                height: 2 * kSpacing,
              ),
              Text(
                'Delete',
                style: AppStyles.fontsBold14(context)
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              )
            ],
          ),
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
      ],
    );
  }
}
