import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
