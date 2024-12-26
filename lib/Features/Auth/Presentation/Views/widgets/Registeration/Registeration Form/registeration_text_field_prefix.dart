import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterationTextFieldPrefix extends StatelessWidget {
  const RegisterationTextFieldPrefix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: kSpacing*6),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Image.asset(
              Assets.imagesFreeFlag,
              width: 24,
              height: 30,
            ),
            const SizedBox(
              width: kSpacing*2,
            ),
            Text(
              '+963',
              style: AppStyles.fontsMedium16(context),
            ),
            const SizedBox(
              width: kSpacing*3,
            ),
            SizedBox(
              height: 16,
              child: VerticalDivider(
                width: 0,
                color: const Color(0xff302F34).withOpacity(.4),
              ),
            ),
            const SizedBox(
              width: kSpacing*3,
            ),
          ],
        ),
      ),
    );
  }
}
