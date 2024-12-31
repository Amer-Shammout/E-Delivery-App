import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      this.radius = 32,
      this.userImage,
      this.borderWidth = 2,
      this.padding = 24,
      this.networkImage,
      this.fileImage});
  final double padding;
  final double radius;
  final double borderWidth;
  final String? userImage;
  final String? networkImage;
  final String? fileImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: borderWidth, color: Theme.of(context).colorScheme.surface),
        boxShadow: const [Shadows.iconDropShadow],
      ),
      child: CircleAvatar(
        backgroundColor: SetThemeColors.setBackgroundColor(context),
        backgroundImage: userImage == null
            ? networkImage != null
                ? CachedNetworkImageProvider(networkImage!)
                : FileImage(
                    File(
                      fileImage!,
                    ),
                  )
            : null,
        radius: radius,
        child: userImage == Assets.imagesUser
            ? Padding(
                padding: EdgeInsets.all(
                    userImage == Assets.imagesUser ? padding : 0),
                child: ClipOval(
                  child: Image.asset(
                    color: Theme.of(context).colorScheme.primary,
                    userImage ?? '',
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
