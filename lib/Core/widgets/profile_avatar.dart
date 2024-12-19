import 'dart:io';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      this.radius = 32,
      this.userImage = Assets.imagesUser,
      this.borderWidth = 2,
      this.padding = 24});
  final double padding;
  final double radius;
  final double borderWidth;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: borderWidth, color: Theme.of(context).colorScheme.secondary),
        boxShadow: const [Shadows.iconDropShadow],
      ),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        backgroundImage: userImage == Assets.imagesUser
            ? null
            : FileImage(
                File(
                  userImage,
                ),
              ),
        radius: radius,
        child: userImage == Assets.imagesUser
            ? Padding(
                padding: EdgeInsets.all(
                    userImage == Assets.imagesUser ? padding : 0),
                child: ClipOval(
                  child: Image.asset(
                    color: Theme.of(context).colorScheme.primary,
                    userImage,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
