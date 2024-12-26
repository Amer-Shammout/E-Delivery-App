import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmptyCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 80,
      leading: const Padding(
        padding: EdgeInsets.all(16),
        child: CustomIcon(icon: Assets.iconsBackArrow),
      ),
      title: Text(
        S.of(context).cart1,
        style: AppStyles.fontsBold28(context).copyWith(
          color: kPrimaryColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
