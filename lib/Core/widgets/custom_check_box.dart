import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
  });

  final bool value;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color:
            value ? Theme.of(context).colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Center(
        child: value
            ? SvgPicture.asset(
                Assets.iconsCheck,
                width: 5.5,
                height: 5.5,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
