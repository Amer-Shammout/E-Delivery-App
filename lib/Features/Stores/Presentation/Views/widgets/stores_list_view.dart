import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({
    super.key,
    required this.stores,
  });

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          bottom: kSpacing * 4,
        ),
        child: StoresCard(
          cardColor: Color(
              int.parse(stores[index].logoColor!.replaceFirst('#', '0xff'))),
          storeLogo: stores[index].image!,
        ),
      ),
      itemCount: stores.length,
    );
  }
}
