import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatusAppBar extends StatelessWidget {
  const StatusAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kProfileView,
              );
            },
            child: const ProfileAvatar(
              padding: 16,
            ),
          ),
          const SizedBox(
            width: 2 * kSpacing,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: AppStyles.fontsRegular10(context).copyWith(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.4),
                ),
              ),
              const SizedBox(
                height: 0.5 * kSpacing,
              ),
              Text(
                'Ahmad Mohsen',
                style: AppStyles.fontsSemiBold14(context).copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomIcon(
            icon: Assets.iconsCart,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCartView);
            },
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
