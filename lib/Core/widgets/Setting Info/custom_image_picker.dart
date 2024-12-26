import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // تخزين الصورة المختارة

  Future<void> _pickImage() async {
    // افتح معرض الصور لاختيار صورة
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image; // خزّن الصورة المختارة
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileAvatar(
            radius: 45,
            borderWidth: 4,
            userImage: _image?.path ?? Assets.imagesUser,
          ),
          const SizedBox(
            height: 4,
          ),
          CustomTextButtonWithIcon(
            onPressed: () {},
            title: S.of(context).upload_photo_button,
            style: AppStyles.fontsRegular16(context),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
