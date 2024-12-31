import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/setting_info_functions.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_image_picker.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_map.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/setting_info_model.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/setting_info_cubit/setting_info_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class SettingInfoForm extends StatefulWidget {
  const SettingInfoForm({super.key});

  @override
  State<SettingInfoForm> createState() => _SettingInfoFormState();
}

class _SettingInfoFormState extends State<SettingInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  String? phoneNumber;
  String? fullName;
  XFile? profileImage;
  LocationData? userLocation;
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImagePicker(
            pickImage: () async {
              profileImage = await SettingInfoFunctions.pickImage();
              return profileImage!;
            },
          ),
          const SizedBox(
            height: kSpacing * 8,
          ),
          CustomTextFormField(
            onSaved: (value) {
              fullName = value;
            },
            hint: S.of(context).full_name_hint,
            validator: Validation.validateFieldIfEmpty,
            contentPadding: 16,
            maxLines: 1,
          ),
          const SizedBox(
            height: kSpacing * 4,
          ),
          CustomMap(
            getUserLocation: () async {
              userLocation = await SettingInfoFunctions.getUserLocation();
              return userLocation!;
            },
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            fillColor: Theme.of(context).colorScheme.primary,
            style: AppStyles.fontsSemiBold20(context),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                log(profileImage!.path);
                MultipartFile profileImageMultiPartFile =
                    await MultipartFile.fromFile(
                  profileImage!.path,
                );
                SettingInfoModel settingInfoModel = SettingInfoModel(
                    fullName: fullName,
                    longitude: userLocation?.longitude,
                    latitude: userLocation?.latitude,
                    image: profileImageMultiPartFile);
                BlocProvider.of<SettingInfoCubit>(context)
                    .settingInfo(settingInfoModel);
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: S.of(context).submit_button,
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }
}
