import 'package:e_delivery_app/Core/services/firebase_notification.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registeration/Registeration%20Form/registeration_text_field_prefix.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Text(S.of(context).register2, style: AppStyles.fontsBold24(context)),
          const SizedBox(
            height: kSpacing,
          ),
          Opacity(
            opacity: .6,
            child: Text(
              S.of(context).register3,
              style: AppStyles.fontsRegular16(context).copyWith(
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
            onSaved: (inputPhoneNumber) {
              phoneNumber = "+963$inputPhoneNumber";
            },
            validator: Validation.validatePhoneNumber,
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

                RegisterationModel registerationModel = RegisterationModel(
                    phoneNumber: phoneNumber!,
                    fcmToken: (await FirebaseNotification.getFCMToken())!);
                BlocProvider.of<RegisterCubit>(context)
                    .register(registerationModel);
                // GoRouter.of(context).pushReplacementNamed(
                //     AppRouter.kVerificationName,
                //     pathParameters: {'phoneNumber': phoneNumber!});
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: S.of(context).register_button,
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }
}
