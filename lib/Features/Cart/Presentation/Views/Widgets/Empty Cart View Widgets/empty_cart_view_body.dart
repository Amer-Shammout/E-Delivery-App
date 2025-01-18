import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EmptyCartViewBody extends StatelessWidget {
  const EmptyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          height: 160,
          width: 160,
          Assets.iconsCart,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.srcATop),
        ),
        const SizedBox(
          height: kSpacing,
        ),
        Text(
          S.of(context).empty_cart,
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
        ),
        const SizedBox(
          height: 8 * kSpacing,
        ),
        SizedBox(
          width: 200,
          child: CTAButton(
            fillColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              GoRouter.of(context).pushReplacementNamed(AppRouter.kAppRootName);
            },
            title: S.of(context).go_shopping,
            style: AppStyles.fontsSemiBold20(context),
          ),
        ),
      ],
    );
  }
}
