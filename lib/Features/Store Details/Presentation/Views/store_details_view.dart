import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/widgets/store_details_view_body_builder.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreDetailsViewBodyBuilder(
        storeModel: storeModel,
      ),
    );
  }
}
