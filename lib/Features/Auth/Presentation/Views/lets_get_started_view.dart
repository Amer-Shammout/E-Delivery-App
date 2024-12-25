import 'dart:ui';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/lets%20get%20started/lets_get_started_body.dart';
import 'package:flutter/material.dart';

class LetsGetStartedView extends StatelessWidget {
  const LetsGetStartedView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      image: Assets.imagesLetsGetStartedTruck,
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 1,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                center: AlignmentDirectional.topStart,),
          ),
          child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: LetsGetStartedBody(),
          ),
        ),
      ),
    );
  }
}
