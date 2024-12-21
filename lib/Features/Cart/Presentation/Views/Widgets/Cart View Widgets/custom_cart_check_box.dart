import 'package:e_delivery_app/Core/widgets/custom_check_box.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CustomCartCheckBox extends StatefulWidget {
  const CustomCartCheckBox({super.key});

  @override
  State<CustomCartCheckBox> createState() => _CustomCartCheckBoxState();
}

class _CustomCartCheckBoxState extends State<CustomCartCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        if (value) {
          _customBottomSheet(context);
        }

        setState(() {});
      },
      child: CustomCheckBox(value: value),
    );
  }

  PersistentBottomSheetController _customBottomSheet(BuildContext context) {
    return showBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      builder: (context) {
        return const CartBottomSheet();
      },
    );
  }
}
