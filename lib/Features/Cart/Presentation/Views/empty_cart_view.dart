import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 80,
          leading: const Padding(
            padding: EdgeInsets.all(16),
            child: CustomIcon(icon: Assets.iconsBackArrow),
          ),
          title: Text(
            'Cart',
            style: FontStyles.fontsBold28(context).copyWith(
              color: kPrimaryColor,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 160,
                width: 160,
                Assets.iconsCart,
                colorFilter:
                    const ColorFilter.mode(kPrimaryColor, BlendMode.srcATop),
              ),
              const SizedBox(
                height: kSpacing,
              ),
              Text(
                'Your Cart is Empty!',
                style: FontStyles.fontsRegular16(context).copyWith(
                  color: kPrimaryColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                height: 8 * kSpacing,
              ),
              SizedBox(
                width: 200,
                child: CTAButton(
                  onPressed: () {},
                  title: 'Go Shopping',
                  style: FontStyles.fontsSemiBold20(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
