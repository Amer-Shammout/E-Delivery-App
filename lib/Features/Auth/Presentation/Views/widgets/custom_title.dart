import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyles.fontsBlack48(context).copyWith(
            color: kPrimaryColor,
          ),
        ),
        const CustomDash(),
      ],
    );
  }
}
