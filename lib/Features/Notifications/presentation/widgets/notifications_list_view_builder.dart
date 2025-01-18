import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/manager/cubit/get_notifications_cubit.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/widgets/empty_notifications_body.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/widgets/notifications_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsListViewBuilder extends StatefulWidget {
  const NotificationsListViewBuilder({super.key});

  @override
  State<NotificationsListViewBuilder> createState() =>
      _NotificationsListViewBuilderState();
}

class _NotificationsListViewBuilderState
    extends State<NotificationsListViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetNotificationsCubit>(context).getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
        builder: (context, state) {
      if (state is GetNotificationsEmpty) {
        return const EmptyNotificationsBody();
      } else if (state is GetNotificationsFailure) {
        return Center(
          child: Text(state.errMessage),
        );
      } else if (state is GetNotificationsSuccess) {
        return NotificationsListView(notifications: state.notifications);
      } else {
        return const Center(
          child: CustomProgressIndicator(
            height: 24,
            width: 24,
            strokeWidth: 3,
          ),
        );
      }
    });
  }
}
