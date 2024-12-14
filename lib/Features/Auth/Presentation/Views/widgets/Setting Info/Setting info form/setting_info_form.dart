import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/custom_image_picker.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/custom_map.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingInfoForm extends StatefulWidget {
  const SettingInfoForm({super.key});

  @override
  State<SettingInfoForm> createState() => _SettingInfoFormState();
}

class _SettingInfoFormState extends State<SettingInfoForm> {
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
          const CustomImagePicker(),
          const SizedBox(
            height: kSpacing * 8,
          ),
          CustomTextFormField(
            hint: 'Full Name',
            validator: (value) {
              if (value == '') {
                return 'field is required!';
              }
              return null;
            },
            contentPadding: 16,
            maxLines: 1,
          ),
          const SizedBox(
            height: kSpacing * 4,
          ),
          const CustomMap(),
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
            title: 'SUBMIT',
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }
}
