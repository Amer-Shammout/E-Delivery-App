import 'package:e_delivery_app/Features/Notifications/data/models/notifications_model.dart';
import 'package:e_delivery_app/Features/Notifications/presentation/widgets/notifications_tile.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notifications});

  final List<NotificationsModel> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding,),
      itemBuilder: (context, index) =>
          CustomNotificationsTile(notificationsModel: notifications[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: kSpacing * 4,
      ),
      itemCount: notifications.length,
    );
  }
}
