import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key, required this.onEnd});

  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    DateTime timer = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute + 1,
      DateTime.now().second + 30,
    );
    return TimerCountdown(
      onEnd: onEnd,
      format: CountDownTimerFormat.minutesSeconds,
      timeTextStyle: FontStyles.fontsRegular14(context),
      colonsTextStyle: FontStyles.fontsRegular14(context),
      spacerWidth: kSpacing,
      endTime: timer,
      enableDescriptions: false,
    );
  }
}
