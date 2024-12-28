import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/custom_timer.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/verification_text_field.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  bool isEnd = false;

  String code = "0000";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).verification2,
            style: AppStyles.fontsBold24(context),
          ),
          const SizedBox(
            height: kSpacing,
          ),
          SizedBox(
            width: 217,
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).verification3,
                    style: AppStyles.fontsRegular16(context).copyWith(
                      color: Theme.of(context).colorScheme.primary.withOpacity(
                            .6,
                          ),
                    ),
                  ),
                  TextSpan(
                      text: '+963993865338',
                      style: AppStyles.fontsSemiBold16(context)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: kSpacing * 8,
          ),
          VerificationTextField(
            onSaved1: (data) {
              code.replaceRange(0, 1, data!);
            },
            onSaved2: (data) {
              code.replaceRange(1, 2, data!);
            },
            onSaved3: (data) {
              code.replaceRange(2, 3, data!);
            },
            onSaved4: (data) {
              code.replaceRange(3, 4, data!);
            },
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            style: AppStyles.fontsSemiBold20(context),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                VerificationModel verificationModel = VerificationModel(
                  phoneNumber: widget.phoneNumber,
                  code: code,
                );
                BlocProvider.of<VerificationCubit>(context)
                    .verify(verificationModel);
                // GoRouter.of(context).pushReplacementNamed(
                //   AppRouter.kSettingInfoName,
                // );
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: S.of(context).verification_button,
            icon: Assets.iconsButtonsArrow,
            fillColor: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: kSpacing * 6,
          ),
          AbsorbPointer(
            absorbing: isEnd ? false : true,
            child: Opacity(
              opacity: isEnd ? 1 : .3,
              child: CustomTextButton(
                onPressed: () {
                  setState(() {
                    isEnd = false;
                  });
                },
                title: S.of(context).resend_code_button,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          isEnd
              ? const SizedBox()
              : CustomTimer(
                  onEnd: () {
                    setState(() {
                      isEnd = true;
                    });
                  },
                ),
        ],
      ),
    );
  }
}
