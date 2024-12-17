import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CTAButtonsExamples extends StatelessWidget {
  const CTAButtonsExamples({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CTAButton(
            style: FontStyles.fontsSemiBold20(context),
            onPressed: () {},
            title: 'REGISTER',
          ),
          const SizedBox(
            height: 32,
          ),
          CTAButton(
            style: FontStyles.fontsSemiBold20(context),
            onPressed: () {},
            title: 'LOGOUT',
            fillColor: kWhiteColor.withOpacity(.8),
            strokeColor: kTeranyColor,
            contentColor: kTeranyColor,
            icon: Assets.iconsLogout,
          ),
        ],
      ),
    );
  }
}
