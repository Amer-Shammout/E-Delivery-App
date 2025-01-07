import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_list_view.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoresResultsBody extends StatelessWidget {
  const StoresResultsBody({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return stores.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            child: CustomScrollView(
              slivers: [
                StoresListView(stores: stores),
              ],
            ),
          )
        : const Text("No Search Results");
  }
}
