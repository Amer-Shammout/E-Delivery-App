import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      this.radius = 64,
      required this.userImage,
      this.borderWidth = 2});
  final double radius;
  final double borderWidth;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: borderWidth, color: kWhiteColor),
        boxShadow: const [Shadows.iconDropShadow],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          userImage,
        ),
      ),
    );
  }
}
