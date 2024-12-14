import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/add_button.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_content.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        CustomContainer(
          child: SvgPicture.asset(
            Assets.imagesHomeCard,
          ),
        ),
        const Positioned(
          top: 16,
          bottom: 12,
          left: 16,
          child: ProductContent(),
        ),
        const Positioned(
          right: 14,
          bottom: 14,
          child: AddButton(),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: Text(
            'HOT',
            style:
                FontStyles.fontsBold10(context).copyWith(color: kTeranyColor),
          ),
        ),
      ],
    );
  }
}
