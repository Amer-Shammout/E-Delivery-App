// ignore_for_file: use_build_context_synchronously

import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/functions/setting_info_functions.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_image_picker.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_map.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_location_cubit/update_location_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_name_cubit/update_name_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    User user = BlocProvider.of<GetUserCubit>(context).user!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    CustomImagePicker(
                      pickImage: () => SettingInfoFunctions.pickImage(),
                    ),
                    const SizedBox(
                      height: kSpacing * 8,
                    ),
                    Form(
                      key: _formKey,
                      child: CustomTextFormField(
                        onFieldSubmitted: (data) async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await BlocProvider.of<UpdateNameCubit>(context)
                                .updateName(data);
                          } else {
                            showFailureSnackBar("Enter a Valid Name!", context);
                          }
                        },
                        initialValue: 'Amer Shammout',
                        validator: Validation.validateFieldIfEmpty,
                        contentPadding: 16,
                        maxLines: 1,
                        suffixIcon:
                            BlocConsumer<UpdateNameCubit, UpdateNameState>(
                          listener: (context, state) {
                            if (state is UpdateNameSuccess) {
                              showSuccessSnackBar(
                                  S.of(context).edit_name_message, context);
                            }
                            if (state is UpdateNameFailure) {
                              showSuccessSnackBar(state.errMessage, context);
                            }
                          },
                          builder: (context, state) {
                            return state is UpdateNameLoading
                                ? FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  )
                                : FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SvgPicture.asset(
                                      Assets.iconsEdit,
                                      width: 16,
                                      height: 16,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.error,
                                        BlendMode.srcATop,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kSpacing * 4,
                    ),
                    CustomTextFormField(
                      suffixIcon: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          Assets.iconsEdit,
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.error,
                            BlendMode.srcATop,
                          ),
                        ),
                      ),
                      maxLength: 9,
                      initialValue: '993865338',
                      textInputType: TextInputType.number,
                      prefix: const RegisterationTextFieldPrefix(),
                      validator: Validation.validatePhoneNumber,
                      contentPadding: 16,
                    ),
                    const SizedBox(
                      height: kSpacing * 4,
                    ),
                    Stack(
                      children: [
                        CustomMap(
                          getUserLocation: () async {
                            showWaitSnackBar(context);
                            LocationData? userLocation =
                                await SettingInfoFunctions.getUserLocation();
                            if (userLocation != null) {
                              await BlocProvider.of<UpdateLocationCubit>(
                                      context)
                                  .updateLocation(userLocation);
                            } else {
                              showFailureSnackBar(
                                  AppStrings.strInternalServerError, context);
                            }
                            return userLocation;
                          },
                        ),
                        BlocConsumer<UpdateLocationCubit, UpdateLocationState>(
                          listener: (context, state) {
                            if (state is UpdateLocationSuccess) {
                              showSuccessSnackBar(
                                  S.of(context).edit_location_message, context);
                            }
                            if (state is UpdateLocationFailure) {
                              showSuccessSnackBar(state.errMessage, context);
                            }
                          },
                          builder: (context, state) {
                            return state is UpdateLocationLoading
                                ? Positioned(
                                    right: 12,
                                    bottom: 12,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color:
                                            SetThemeColors.setBackgroundColor(
                                                context),
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        boxShadow: const [
                                          Shadows.iconDropShadow
                                        ],
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kSpacing * 8,
                    )
                  ],
                ),
              ],
            ),
          ),
          BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutFailure) {
                showFailureSnackBar(state.errMessage, context);
              }
              if (state is LogoutSuccess) {
                GoRouter.of(context)
                    .pushReplacementNamed(AppRouter.kRegisterationName);
              }
            },
            builder: (context, state) {
              return (state is LogoutLoading)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : CTAButton(
                      style: AppStyles.fontsSemiBold20(context),
                      onPressed: () async {
                        await BlocProvider.of<LogoutCubit>(context).logout();
                      },
                      title: S.of(context).logout_button,
                      fillColor:
                          Theme.of(context).colorScheme.surface.withOpacity(.8),
                      strokeColor: Theme.of(context).colorScheme.tertiary,
                      contentColor: Theme.of(context).colorScheme.tertiary,
                      icon: Assets.iconsLogout,
                    );
            },
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
        ],
      ),
    );
  }
}
