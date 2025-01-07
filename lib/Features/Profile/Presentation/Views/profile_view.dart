import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_view_body.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      color: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar2(
          title: S.of(context).profile,
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
