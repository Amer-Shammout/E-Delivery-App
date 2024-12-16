import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_form.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterationViewBody extends StatelessWidget {
  const RegisterationViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .12,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomWidgetWithDash(
                        widget: Text(
                          'WELCOME',
                          style: FontStyles.fontsBlack48(context)
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .12,
                    ),
                    const RegisterationForm(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .36,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -60,
                bottom: -50,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 100),
                        blurRadius: 40,
                        color: Colors.black.withOpacity(.2),
                      )
                    ],
                  ),
                  child: Image.asset(
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.scaleDown,
                    Assets.imagesBoxes,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
