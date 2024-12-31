import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StatusAppBarSuccess extends StatelessWidget {
  const StatusAppBarSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    User user = BlocProvider.of<GetUserCubit>(context).user!;
    return Padding(
      padding: const EdgeInsets.only(
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          top: kSpacing * 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kProfileName,
              );
            },
            child: ProfileAvatar(
              userImage: user.image == null ? Assets.imagesUser : null,
              padding: kSpacing * 4,
              networkImage: user.image,
            ),
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
                user.fullName,
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
              GoRouter.of(context).pushNamed(AppRouter.kCartName);
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
