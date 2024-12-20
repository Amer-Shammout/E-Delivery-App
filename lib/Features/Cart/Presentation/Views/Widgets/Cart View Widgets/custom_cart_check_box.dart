import 'package:e_delivery_app/Core/widgets/custom_check_box.dart';
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
        setState(() {});
      },
      child: CustomCheckBox(value: value),
    );
  }
}
