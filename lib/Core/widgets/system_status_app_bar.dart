import 'package:flutter/material.dart';

class SystemStatusAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SystemStatusAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
