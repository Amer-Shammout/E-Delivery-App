import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinusIcon extends StatelessWidget {
  const MinusIcon(
      {super.key,
      required this.id,
      required this.quantity,
      required this.color});

  final int id;
  final int quantity;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return quantity > 1
        ? GestureDetector(
            onTap: () {
              // BlocProvider.of<EditQuantityCubit>(context).decrementQuantity(id);
            },
            child: CustomIconButton(icon: Assets.iconsMinus, color: color),
          )
        : CustomIconButton(
            icon: Assets.iconsMinus, color: color.withOpacity(0.2));
  }
}
