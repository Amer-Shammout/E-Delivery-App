import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/setting_info_form.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/setting_info_cubit/setting_info_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingInfoBody extends StatelessWidget {
  const SettingInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingInfoCubit, SettingInfoState>(
      listener: (context, state) {
        if (state is SettingInfoSuccess) {
          GoRouter.of(context)
              .pushReplacement(AppRouter.kAppRootName, extra: state.user);
        }
        if (state is SettingInfoFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: (state is SettingInfoLoading),
          progressIndicator: Lottie.asset(
            SetThemeColors.isDarkMode(context)
                ? Assets.lottieLoadingDark
                : Assets.lottieLoadingLight,
            height: 100,
            width: 100,
          ),
          child: CustomBackgroundContainer(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomWidgetWithDash(
                      dashColor: Theme.of(context).colorScheme.primary,
                      widget: Text(
                        S.of(context).setting_info1,
                        style: AppStyles.fontsBlack48(context).copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  const SettingInfoForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
