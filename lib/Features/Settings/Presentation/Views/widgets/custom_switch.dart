import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.isSwitched,
    this.onChanged,
  });

  final bool isSwitched;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 40,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isSwitched,
          onChanged: onChanged,
          inactiveThumbImage: const Svg(Assets.iconsThumb,
              size: Size(32, 32), color: Colors.white),
          activeThumbImage: const Svg(Assets.iconsThumb,
              size: Size(32, 32), color: Colors.white),
          thumbColor: const WidgetStatePropertyAll(
            Colors.white,
          ),
          inactiveThumbColor: Theme.of(context).colorScheme.surface,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveTrackColor: SetThemeColors.isDarkMode(context) ? Theme.of(context).colorScheme.secondary : Colors.grey.shade300,
          activeColor: Theme.of(context).colorScheme.primary,
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
