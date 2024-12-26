import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/select_all.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomIcon(
          icon: Assets.iconsBackArrow,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      title: Text(
        S.of(context).cart1,
        style: AppStyles.fontsBold28(context).copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [
        SelectAll(),
        SizedBox(
          width: 16,
        )
      ],
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
