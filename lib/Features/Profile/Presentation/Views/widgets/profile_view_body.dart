import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_image_picker.dart';
import 'package:e_delivery_app/Core/widgets/Setting%20Info/custom_map.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    const CustomImagePicker(),
                    const SizedBox(
                      height: kSpacing * 8,
                    ),
                    CustomTextFormField(
                      initialValue: 'Amer Shammout',
                      validator: Validation.validateFieldIfEmpty,
                      contentPadding: 24,
                      maxLines: 1,
                      suffixIcon: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          Assets.iconsEdit,
                          width: 24,
                          height: 24,
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
                          width: 24,
                          height: 24,
                        ),
                      ),
                      maxLength: 9,
                      initialValue: '993865338',
                      textInputType: TextInputType.number,
                      prefix: const RegisterationTextFieldPrefix(),
                      validator: Validation.validatePhoneNumber,
                    ),
                    const SizedBox(
                      height: kSpacing * 4,
                    ),
                    const CustomMap(),
                    const SizedBox(
                      height: kSpacing * 8,
                    )
                  ],
                ),
              ],
            ),
          ),
          CTAButton(
            onPressed: () {},
            title: 'LOGOUT',
            fillColor: kWhiteColor.withOpacity(.8),
            strokeColor: kTeranyColor,
            contentColor: kTeranyColor,
            icon: Assets.iconsLogout,
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
        ],
      ),
    );
  }
}
