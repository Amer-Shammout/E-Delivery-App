import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/filter_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_form_field.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onTap, this.isEnabled});

  final VoidCallback? onTap;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: kWhiteColor,
        child: Row(
          children: [
            Expanded(
              // ignore: missing_required_param
              child: CustomTextFormField(
                isEnabled: isEnabled ?? true,
                contentPadding: 16,
                hint: 'Search...',
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    Assets.iconsSearch,
                    width: 24,
                    height: 24,
                    colorFilter:
                        const ColorFilter.mode(kBlackColor, BlendMode.srcATop),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 2 * kSpacing,
            ),
            const FilterButton(),
          ],
        ),
      ),
    );
  }
}
