import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/filter_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, this.onTap, this.isEnabled, this.onSelected, this.onChanged});

  final VoidCallback? onTap;
  final bool? isEnabled;
  final void Function(String)? onSelected;
  final dynamic Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            Expanded(
              // ignore: missing_required_param
              child: CustomTextFormField(
                onChanged: onChanged,
                isEnabled: isEnabled ?? true,
                contentPadding: 16,
                hint: S.of(context).search_hint,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    Assets.iconsSearch,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.error, BlendMode.srcATop),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 2 * kSpacing,
            ),
            FilterButton(
              onSelected: onSelected,
            ),
          ],
        ),
      ),
    );
  }
}
