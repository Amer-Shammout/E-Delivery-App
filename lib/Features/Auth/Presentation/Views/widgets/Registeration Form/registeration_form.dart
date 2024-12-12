import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

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
  void dispose() {
    _formKey.currentState!.dispose();
    super.dispose();
  }

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
                color: kPrimaryColor,
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
            validator: (phoneNumber) {
              return validatePhoneNumber(phoneNumber);
            },
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: 'Register',
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }
}

String? validatePhoneNumber(String? phoneNumber) {
  final RegExp regExp = RegExp(r'^\9[0-9]{8}$');

  if (phoneNumber == null || phoneNumber == '') {
    return 'field is required';
  }

  if (!regExp.hasMatch(phoneNumber)) {
    return 'الرجاء إدخال رقم موبايل صحيح. يجب أن يبدأ ب +9639 ويتبعه 8 أرقام.';
  }

  return null;
}
