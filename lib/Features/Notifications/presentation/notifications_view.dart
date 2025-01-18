import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Features/Notifications/data/repos/notifications_repo_impl.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/manager/cubit/get_notifications_cubit.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/widgets/notifications_view_body.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotificationsCubit(getIt.get<NotificationsRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppBar2(
          title: S.of(context).notifications,
        ),
        body: const NotificationsViewBody(),
      ),
    );
  }
}
