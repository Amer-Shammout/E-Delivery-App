import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchOperationDetails extends StatelessWidget {
  const SearchOperationDetails({
    super.key,
    required this.onPressed, required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: kHorizontalPadding,
        end: kHorizontalPadding,
        bottom: kSpacing * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.fontsMedium28(context),
          ),
          CustomTextButton(
            onPressed: onPressed,
            title: S.of(context).see_all,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
