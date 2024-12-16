import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_content.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_price.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 4, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesHomeCard,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  'HOT',
                  style: FontStyles.fontsBold10(context)
                      .copyWith(color: kTeranyColor),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            Center(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Image.asset(
                  Assets.imagesIphoneTest,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const Spacer(),
            const ProductContent(),
            const Spacer(
              flex: 2,
            ),
            const ProductPrice(),
          ],
        ),
      ),
    );
  }
}
