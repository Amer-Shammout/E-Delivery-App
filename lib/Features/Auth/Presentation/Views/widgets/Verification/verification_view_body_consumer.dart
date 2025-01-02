import 'dart:developer';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/verification_view_body.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationViewBodyConsumer extends StatelessWidget {
  const VerificationViewBodyConsumer({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationSuccess) {
          if (state.verificationResponseModel.isNewUser!) {
            GoRouter.of(context)
                .pushReplacementNamed(AppRouter.kSettingInfoName);
          } else {
            GoRouter.of(context).pushReplacementNamed(AppRouter.kAppRootName,
                extra: state.verificationResponseModel.user);
          }
        }
        if (state is VerificationFailure) {
          showFailureSnackBar(state.errMessage, context);
          log('Failure');
        }
      },
      builder: (context, state) {
        return VerificationViewBody(
          phoneNumber: phoneNumber,
          state: state,
        );
      },
    );
  }
}
