import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_list_view.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AllStoresView extends StatelessWidget {
  const AllStoresView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: S.of(context).all_products,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: CustomScrollView(
          slivers: [
            StoresListView(stores: stores),
          ],
        ),
      ),
    );
  }
}
