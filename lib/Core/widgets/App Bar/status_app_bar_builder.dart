import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_error.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_loading.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusAppBarBuilder extends StatelessWidget {
  const StatusAppBarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return const StatusAppBarSuccess();
        }
        if (state is GetUserFailure) {
          return const StatusAppBarError();
        }
        return const StatusAppBarLoading();
      },
      listener: (context, state) {
        if (state is GetUserFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
      },
    );
  }
}
