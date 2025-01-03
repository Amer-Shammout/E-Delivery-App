import 'dart:developer';

import 'package:e_delivery_app/Core/services/firebase_notification.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registration/Registration%20Form/registration_text_field_prefix.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextFormField(
              maxLength: 9,
              hint: '9xx xxx xxx',
              textInputType: TextInputType.number,
              prefix: const RegistrationTextFieldPrefix(),
              onSaved: (inputPhoneNumber) {
                phoneNumber = "+963$inputPhoneNumber";
              },
              validator: (phoneNumber) =>
                  Validation.validatePhoneNumber(phoneNumber, context),
            ),
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            fillColor: Theme.of(context).colorScheme.primary,
            style: AppStyles.fontsSemiBold20(context),
            onPressed: () async {
              if (FirebaseNotification.isActive ?? false) {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  log(Prefs.getString('id'));
                  RegistrationModel registerationModel = RegistrationModel(
                    phoneNumber: phoneNumber!,
                    fcmToken: FirebaseNotification.fcmToken!,
                  );
                  BlocProvider.of<RegisterCubit>(context)
                      .register(registerationModel);
                } else {
                  _isAutoValidate = AutovalidateMode.always;
                  setState(() {});
                }
              } else {
                await showAlertDialog();
                await FirebaseNotification.getFCMToken();
              }
            },
            title: S.of(context).register_button,
            icon: Assets.iconsButtonsArrow,
          ),
        ],
      ),
    );
  }

  showAlertDialog() => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CupertinoAlertDialog(
          title: Text(S.of(context).permission_denied),
          content: Text(S.of(context).permission_message),
          actions: [
            CupertinoDialogAction(
              textStyle: AppStyles.fontsRegular20(context),
              child: Text(S.of(context).cancel_dialog),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              textStyle: AppStyles.fontsBold20(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                openAppSettings();
              },
              isDefaultAction: true,
              child: Text(S.of(context).settings_dialog),
            ),
          ],
        ),
      );
}
