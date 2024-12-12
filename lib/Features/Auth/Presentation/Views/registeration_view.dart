import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration%20Form/registeration_form.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/custom_title.dart';
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