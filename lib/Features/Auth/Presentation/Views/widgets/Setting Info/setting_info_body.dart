import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/custom_image_picker.dart';
import 'package:flutter/material.dart';

class SettingInfoBody extends StatelessWidget {
  const SettingInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomImagePicker(),
    );
  }
}