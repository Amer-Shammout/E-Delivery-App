import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          overlayColor: Colors.transparent),
      child: Text(
        title,
        style: FontStyles.fontsBold16(context),
      ),
    );
  }
}
