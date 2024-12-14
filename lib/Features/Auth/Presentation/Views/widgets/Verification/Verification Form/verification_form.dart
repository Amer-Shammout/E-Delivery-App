import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/custom_timer.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/verification_text_field.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key});

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  bool isEnd = false;

  @override
  void dispose() {
    _formKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Verification Code',
            style: FontStyles.fontsBold24(context),
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
                    text: 'Please enter code\nsent to ',
                    style: FontStyles.fontsRegular16(context).copyWith(
                      color: kPrimaryColor.withOpacity(
                        .6,
                      ),
                    ),
                  ),
                  TextSpan(
                      text: '+963993865338',
                      style: FontStyles.fontsSemiBold16(context)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: kSpacing * 8,
          ),
          const VerificationTextField(),
          const SizedBox(
            height: kSpacing * 6,
          ),
          CTAButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                GoRouter.of(context).push(
                  AppRouter.kSettingInfoView,
                );
              } else {
                _isAutoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: 'VERIFY',
            icon: Assets.iconsButtonsArrow,
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
                title: 'Resend code',
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
