import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoreDetailsAppBarFlexibleSpace extends StatelessWidget {
  const StoreDetailsAppBarFlexibleSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: CustomBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: kSpacing * 24,
          ),
          child: Column(
            children: [
              Image.asset(
                Assets.imagesSmatelLogoTest,
                width: 250,
                height: 80,
              ),
              const SizedBox(
                height: kSpacing * 2,
              ),
              Text(
                'Samatel Store',
                style: FontStyles.fontsBold18(context)
                    .copyWith(color: kBlackColor),
                textAlign: TextAlign.center,
              ),
              Text(
                '100 Items',
                style: FontStyles.fontsRegular12(context)
                    .copyWith(color: kBlackColor.withOpacity(.6)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
