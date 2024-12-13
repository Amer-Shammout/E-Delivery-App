import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Add',
          style:
              FontStyles.fontsMedium12(context).copyWith(color: kTeranyColor),
        ),
        SvgPicture.asset(
          height: 16,
          width: 16,
          Assets.iconsPlus,
          colorFilter: const ColorFilter.mode(kTeranyColor, BlendMode.srcATop),
        ),
      ],
    );
  }
}
