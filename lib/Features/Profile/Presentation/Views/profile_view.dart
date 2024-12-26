import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      color: Theme.of(context).colorScheme.surface,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ProfileAppBar(),
        body: ProfileViewBody(),
      ),
    );
  }
}
