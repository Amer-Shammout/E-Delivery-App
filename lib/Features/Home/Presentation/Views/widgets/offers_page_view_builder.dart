import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersPageViewBuilder extends StatelessWidget {
  const OffersPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersSuccess) {
          return OffersPageView(
            offers: state.offers,
          );
        } else if (state is GetOffersFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
