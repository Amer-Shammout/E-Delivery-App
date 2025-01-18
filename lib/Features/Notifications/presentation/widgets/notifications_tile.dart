import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Notifications/data/models/notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotificationsTile extends StatelessWidget {
  const CustomNotificationsTile({super.key, required this.notificationsModel});

  final NotificationsModel notificationsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.iconsSolidNotificationsBold,
        width: 16,
        height: 16,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary, BlendMode.srcATop),
      ),
      title: Text(
        notificationsModel.title!,
        style: AppStyles.fontsSemiBold18(context)
            .copyWith(color: Theme.of(context).colorScheme.error),
      ),
      subtitle: Text(
        notificationsModel.body!,
        style: AppStyles.fontsRegular16(context).copyWith(
            fontSize: 14.5,
            color: Theme.of(context).colorScheme.error.withOpacity(.5)),
      ),
    );
  }
}
