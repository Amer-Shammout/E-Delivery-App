import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButtonBuilder extends StatelessWidget {
  const LogoutButtonBuilder({
    super.key,
    required this.state,
  });

  final LogoutState state;

  @override
  Widget build(BuildContext context) {
    return (state is LogoutLoading)
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        : CTAButton(
            style: AppStyles.fontsSemiBold20(context),
            onPressed: () async {
              await BlocProvider.of<LogoutCubit>(context).logout();
            },
            title: S.of(context).logout_button,
            fillColor: Theme.of(context).colorScheme.surface.withOpacity(.8),
            strokeColor: Theme.of(context).colorScheme.tertiary,
            contentColor: Theme.of(context).colorScheme.tertiary,
            icon: Assets.iconsLogout,
          );
  }
}
