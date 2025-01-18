import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon(
      {super.key,
      required this.id,
      required this.totalQuantity,
      required this.quantity,
      required this.color});
  final int id;
  final int totalQuantity;
  final int quantity;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return quantity < totalQuantity
        ? GestureDetector(
            onTap: () {
              //BlocProvider.of<EditQuantityCubit>(context).incrementQuantity(id);
            },
            child: CustomIconButton(icon: Assets.iconsPlus, color: color),
          )
        : CustomIconButton(
            icon: Assets.iconsPlus, color: color.withOpacity(0.2));
  }
}
