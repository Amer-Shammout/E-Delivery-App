import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registration/Registration%20Form/registration_form.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationViewBody extends StatelessWidget {
  const RegistrationViewBody({
    super.key,
    required this.state,
  });
  final RegisterState state;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: (state is RegisterLoading),
      progressIndicator: Lottie.asset(
        SetThemeColors.isDarkMode(context)
            ? Assets.lottieLoadingDark
            : Assets.lottieLoadingLight,
        height: 100,
        width: 100,
      ),
      child: CustomBackgroundContainer(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .12,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomWidgetWithDash(
                          dashColor: Theme.of(context).colorScheme.primary,
                          widget: Text(
                            S.of(context).register1,
                            style: AppStyles.fontsBlack48(context).copyWith(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .12,
                      ),
                      const RegistrationForm(),
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
      ),
    );
  }
}
