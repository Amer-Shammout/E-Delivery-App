import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/setting_info_body_consumer.dart';
import 'package:flutter/material.dart';

class SettingInfoView extends StatelessWidget {
  const SettingInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingInfoBodyConsumer(),
    );
  }
}
