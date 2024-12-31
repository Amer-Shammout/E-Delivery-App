import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/Core/widgets/profile_avatar.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker(
      {super.key, required this.pickImage, this.networkImage});

  final Future<XFile?> Function() pickImage;
  final String? networkImage;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  XFile? _image;

  void displayImage() async {
    final XFile? image = await widget.pickImage();
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: displayImage,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileAvatar(
            radius: 45,
            borderWidth: 4,
            userImage: (_image?.path == null && widget.networkImage == null)
                ? Assets.imagesUser
                : null,
            fileImage: _image?.path,
            networkImage: widget.networkImage,
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
