import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfileAvatarExamples extends StatelessWidget {
  const ProfileAvatarExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileAvatar(
            userImage: Assets.imagesProfile,
            radius: 112,
            borderWidth: 4,
          ),
          SizedBox(
            height: 32,
          ),
          ProfileAvatar(
            userImage: Assets.imagesProfile,
          )
        ],
      ),
    );
  }
}
