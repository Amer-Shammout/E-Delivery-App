import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_name_cubit/update_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NameTextFieldSuffixIconBuilder extends StatelessWidget {
  const NameTextFieldSuffixIconBuilder({
    super.key,
    required this.state,
  });

  final UpdateNameState state;

  @override
  Widget build(BuildContext context) {
    return state is UpdateNameLoading
        ? FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        : FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              Assets.iconsEdit,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.error,
                BlendMode.srcATop,
              ),
            ),
          );
  }
}
