import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_dash.dart';
import 'package:e_delivery_app/Registeration%20View/Registeration%20Form/registeration_form.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterationView extends StatelessWidget {
  const RegisterationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
        child: Stack(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: CustomTitle(
                    title: 'WELCOME',
                  ),
                ),
                Spacer(),
                RegisterationForm(),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          Positioned(
              left: -5,
              bottom: -5,
              child: Image.asset(
                width: MediaQuery.sizeOf(context).width - 90,
                fit: BoxFit.scaleDown,
                Assets.imagesBoxes,
              )),
        ]),
      ),
    );
  }
}



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
