import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/components/glass_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LetsGetStartedBody extends StatelessWidget {
  const LetsGetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2 * kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          Text(
            'We Will',
            style: AppStyles.fontsSemiBold18(context).copyWith(
              color: kWhiteColor.withOpacity(0.4),
            ),
          ),
          CustomWidgetWithDash(
            widget: Text(
              'Make Your Life Easier',
              style: AppStyles.fontsBlack48(context)
                  .copyWith(color: kWhiteColor, fontSize: 55),
            ),
            dashColor: kWhiteColor,
          ),
          const Spacer(),
          GlassButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(
                AppRouter.kRegisterationView,
              );
            },
          ),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
