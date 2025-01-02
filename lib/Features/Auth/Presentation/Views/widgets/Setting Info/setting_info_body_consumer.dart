import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/setting_info_body.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/setting_info_cubit/setting_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingInfoBodyConsumer extends StatelessWidget {
  const SettingInfoBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingInfoCubit, SettingInfoState>(
      listener: (context, state) {
        if (state is SettingInfoSuccess) {
          GoRouter.of(context)
              .pushReplacementNamed(AppRouter.kAppRootName, extra: state.user);
        }
        if (state is SettingInfoFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
      },
      builder: (context, state) {
        return SettingInfoBody(
          state: state,
        );
      },
    );
  }
}
