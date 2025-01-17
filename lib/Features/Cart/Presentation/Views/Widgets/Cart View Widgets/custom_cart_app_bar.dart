import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/select_all.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/update_cart_cubit/update_cart_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.all(16),
        child: RotatedBox(
          quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
          child: BlocBuilder<UpdateCartCubit, UpdateCartState>(
            builder: (context, state) {
              return state is UpdateCartLoading
                  ? const CustomProgressIndicator()
                  : CustomIcon(
                      icon: Assets.iconsBackArrow,
                      onPressed: () async {
                        await BlocProvider.of<UpdateCartCubit>(context)
                            .updateCart(
                                BlocProvider.of<EditQuantityCubit>(context)
                                    .cartItemQuantity!);
                        GoRouter.of(context).pop();
                      },
                    );
            },
          ),
        ),
      ),
      title: Text(
        S.of(context).cart1,
        style: AppStyles.fontsBold28(context).copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [
        SelectAll(),
        SizedBox(
          width: 16,
        )
      ],
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
