import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Core/widgets/loading/my_app_loading_indicator.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/verification_form.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({
    super.key,
    required this.phoneNumber,
    required this.state,
  });

  final String phoneNumber;
  final VerificationState state;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: (state is VerificationLoading),
      progressIndicator: myAppLottieIndicator(context),
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
                            S.of(context).verification1,
                            style: AppStyles.fontsBlack48(context).copyWith(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .12,
                      ),
                      VerificationForm(
                        phoneNumber: phoneNumber,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .36,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -60,
                  bottom: 20,
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
                      width: MediaQuery.sizeOf(context).width - 50,
                      fit: BoxFit.scaleDown,
                      Assets.imagesTruck,
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
