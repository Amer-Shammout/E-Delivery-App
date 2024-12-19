import 'package:e_delivery_app/Core/utils/assets.dart';
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
      height: 24,
      width: 36,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isSwitched,
          onChanged: onChanged,
          inactiveThumbImage: Svg(Assets.iconsThumb,
              size: const Size(32, 32),
              color: Colors.white),
          activeThumbImage: Svg(Assets.iconsThumb,
              size: Size(32, 32), color: Colors.white),
          thumbColor:
              WidgetStatePropertyAll(Colors.white,),
          inactiveThumbColor: Theme.of(context).colorScheme.surface,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveTrackColor: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).colorScheme.primary,
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
