import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        appBar: ProfileAppBar(),
        body: ProfileViewBody(),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
  Size get preferredSize => new Size.fromHeight(60);
}
