import 'dart:ui';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.42, 1.0],
              colors: [
                kWhiteColor.withOpacity(0.2),
                kWhiteColor.withOpacity(0.1),
              ],
            ),
            border: GradientBoxBorder(
              width: 2,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.4, 1.0],
                colors: [
                  kWhiteColor.withOpacity(.6),
                  kWhiteColor.withOpacity(.2),
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              // Shadows.glassDropShadow,
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5 * kSpacing),
                backgroundColor: Colors.transparent,
                elevation: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).lets_get_started_button,
                  style: AppStyles.fontsRegular24(context)
                      .copyWith(color: kWhiteColor),
                ),
                const SizedBox(
                  width: 2 * kSpacing,
                ),
                SvgPicture.asset(
                  Assets.iconsGetStartedArrow,
                  width: 16,
                  height: 16,
                  colorFilter:
                      const ColorFilter.mode(kWhiteColor, BlendMode.srcATop),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
