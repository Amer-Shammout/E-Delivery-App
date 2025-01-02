import 'dart:developer';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registration/registration_view_body.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationViewBodyConsumer extends StatelessWidget {
  const RegistrationViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).pushReplacementNamed(AppRouter.kVerificationName,
              pathParameters: {'phoneNumber': state.phoneNumber});
          log('success');
        }
        if (state is RegisterFailure) {
          showFailureSnackBar(state.errMessage, context);

          log('failure');
        }
      },
      builder: (context, state) {
        return RegistrationViewBody(
          state: state,
        );
      },
    );
  }
}
