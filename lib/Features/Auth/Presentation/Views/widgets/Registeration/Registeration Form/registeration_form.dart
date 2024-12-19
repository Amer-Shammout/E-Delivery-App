
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({super.key});

  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  String? phoneNumber;
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your phone number',
              style: FontStyles.fontsBold24(context)),
          const SizedBox(
            height: kSpacing,
          ),
          Opacity(
            opacity: .6,
            child: Text(
              'We will send you the 4 digit verification code',
              style: FontStyles.fontsRegular16(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: kSpacing * 8,
          ),
          CustomTextFormField(
            maxLength: 9,
            hint: '9xx xxx xxx',
            textInputType: TextInputType.number,
            prefix: const RegisterationTextFieldPrefix(),
            onChanged: (inputPhoneNumber) {
              phoneNumber = inputPhoneNumber;
            },
            validator: Validation.validatePhoneNumber,
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            style: FontStyles.fontsSemiBold20(context),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                GoRouter.of(context).pushReplacement(
                  AppRouter.kVerificationView,
                );
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: 'REGISTER',
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }
}
