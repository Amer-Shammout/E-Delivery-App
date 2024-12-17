import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SystemStatusAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SystemStatusAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(0);
}
