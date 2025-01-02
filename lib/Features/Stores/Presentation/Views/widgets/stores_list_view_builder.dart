import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_list_view.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/manager/get_stores_cubit/get_stores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class StoresListViewBuilder extends StatelessWidget {
  const StoresListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoresCubit, GetStoresState>(
      builder: (context, state) {
        if (state is GetStoresSuccess) {
          return StoresListView(
            stores: state.stores,
          );
        } else if (state is GetStoresFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return SliverFillRemaining(
            child: Center(
              child: Lottie.asset(
                SetThemeColors.isDarkMode(context)
                    ? Assets.lottieLoadingDark
                    : Assets.lottieLoadingLight,
                height: 100,
                width: 100,
              ),
            ),
          );
        }
      },
    );
  }
}
