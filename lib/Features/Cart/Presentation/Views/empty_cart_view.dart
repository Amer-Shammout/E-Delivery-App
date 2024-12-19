import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Empty%20Cart%20View%20Widgets/empty_cart_app_bar.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Empty%20Cart%20View%20Widgets/empty_cart_view_body.dart';

import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: EmptyCartAppBar(),
        body: Center(
          child: EmptyCartViewBody(),
        ),
      ),
    );
  }
}
