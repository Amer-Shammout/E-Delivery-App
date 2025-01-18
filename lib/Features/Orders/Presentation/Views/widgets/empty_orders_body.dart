import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyOrdersBody extends StatelessWidget {
  const EmptyOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 160,
            width: 160,
            Assets.iconsSolidOrdersBold,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcATop),
          ),
          const SizedBox(
            height: kSpacing,
          ),
          Text(
            S.of(context).empty_orders_message,
            style: AppStyles.fontsMedium16(context).copyWith(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
