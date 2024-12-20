import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.toDo,
  });
  final void Function() toDo;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        widget.toDo;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: value
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
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
      ),
    );
  }
}
