import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class StatusAppBarError extends StatelessWidget {
  const StatusAppBarError({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          top: kSpacing * 4),
      child: Row(
        children: [
          const ProfileAvatar(
            userImage: Assets.imagesUser,
            padding: kSpacing * 4,
          ),
          const SizedBox(
            width: 2 * kSpacing,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).home1,
                style: AppStyles.fontsRegular10(context).copyWith(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.4),
                ),
              ),
              const SizedBox(
                height: 0.5 * kSpacing,
              ),
              Text(
                S.of(context).default_user_message,
                style: AppStyles.fontsSemiBold14(context).copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
          const Spacer(),
          const CustomIcon(
            icon: Assets.iconsCart,
          ),
          const SizedBox(
            width: 4 * kSpacing,
          ),
          const CustomIcon(icon: Assets.iconsNotification),
        ],
      ),
    );
  }
}
