import 'dart:ui';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/custom_title.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/components/glass_button.dart';
import 'package:flutter/material.dart';

class LetsGetStartedView extends StatelessWidget {
  const LetsGetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      image: Assets.imagesLetsGetStartedTruck,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 1,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                center: Alignment.topLeft),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    'We Will',
                    style: FontStyles.fontsSemiBold18(context).copyWith(
                      color: kWhiteColor.withOpacity(0.4),
                    ),
                  ),
                  CustomTitle(
                    dashColor: kWhiteColor,
                    title: 'Make Your Life Easier',
                    style: FontStyles.fontsBlack48(context).copyWith(
                      color: kWhiteColor,
                      fontSize: 70,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  const GlassButton(),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
