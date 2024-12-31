// ignore_for_file: use_build_context_synchronously
import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/setting_info_functions.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_image_picker.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_map.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/logout_button_builder.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/name_text_field_suffix_icon_builder.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_image_cubit/update_image_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_location_cubit/update_location_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_name_cubit/update_name_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
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
                    BlocBuilder<GetUserCubit, GetUserState>(
                      builder: (context, state) {
                        return BlocListener<UpdateImageCubit, UpdateImageState>(
                          listener: (context, state) {
                            if (state is UpdateImageFailure) {
                              showFailureSnackBar(state.errMessage, context);
                            }
                            if (state is UpdateImageSuccess) {
                              showSuccessSnackBar(
                                  S.of(context).edit_image_message, context);
                            }
                            if (state is UpdateImageLoading) {
                              showWaitSnackBar(context);
                            }
                          },
                          child: CustomImagePicker(
                            networkImage: BlocProvider.of<GetUserCubit>(context)
                                .user!
                                .image,
                            pickImage: () async {
                              final XFile? imageFile =
                                  await SettingInfoFunctions.pickImage();
                              if (imageFile != null) {
                                await BlocProvider.of<UpdateImageCubit>(context)
                                    .updateImage(imageFile.path);
                                await BlocProvider.of<GetUserCubit>(context)
                                    .getUser();
                                return imageFile;
                              }
                              return null;
                            },
                          ),
                        );
                      },
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
                            await BlocProvider.of<GetUserCubit>(context)
                                .getUser();
                          } else {
                            showFailureSnackBar(
                                S.of(context).full_name_message2, context);
                          }
                        },
                        initialValue: user.fullName,
                        validator: (fullName) =>
                            Validation.validateFullName(fullName, context),
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
                            return NameTextFieldSuffixIconBuilder(state: state);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kSpacing * 4,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomTextFormField(
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
                        initialValue:
                            user.phoneNumber!.replaceFirst('+963', ''),
                        textInputType: TextInputType.number,
                        prefix: const RegisterationTextFieldPrefix(),
                        validator: (phoneNumber) =>
                            Validation.validatePhoneNumber(
                                phoneNumber, context),
                        contentPadding: 16,
                      ),
                    ),
                    const SizedBox(
                      height: kSpacing * 4,
                    ),
                    Stack(
                      children: [
                        BlocListener<UpdateLocationCubit, UpdateLocationState>(
                          listener: (context, state) {
                            if (state is UpdateLocationSuccess) {
                              showSuccessSnackBar(
                                  S.of(context).edit_location_message, context);
                            }
                            if (state is UpdateLocationFailure) {
                              showFailureSnackBar(state.errMessage, context);
                            }
                          },
                          child: CustomMap(
                            latitide:
                                double.parse(user.latitude ?? '0'),
                            longitude:
                                double.parse(user.longitude ?? '0'),
                            getUserLocation: () async {
                              showWaitSnackBar(context);
                              LocationData? userLocation =
                                  await SettingInfoFunctions.getUserLocation();
                              if (userLocation != null) {
                                await BlocProvider.of<UpdateLocationCubit>(
                                        context)
                                    .updateLocation(userLocation);
                                await BlocProvider.of<GetUserCubit>(context)
                                    .getUser();
                              } else {
                                showFailureSnackBar(
                                    AppStrings.strInternalServerError, context);
                              }
                              return userLocation;
                            },
                          ),
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
              return LogoutButtonBuilder(
                state: state,
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
