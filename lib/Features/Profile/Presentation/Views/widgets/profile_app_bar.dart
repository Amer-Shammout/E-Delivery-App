import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: Text(
        "Profile",
        style: FontStyles.fontsBold28(context),
      ),
      centerTitle: true,
      leading: Center(
        child: CustomIcon(
          icon: Assets.iconsBackArrow,
          iconSize: 12,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          radius: 32,
        ),
      ),
    
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
