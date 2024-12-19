import 'package:e_delivery_app/Core/utils/app_router.dart';
<<<<<<< HEAD
import 'package:e_delivery_app/Features/Product/Presentation/Views/product_view.dart';
=======
import 'package:e_delivery_app/Core/widgets/custom_nav_bar.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/settings_view_body.dart';
>>>>>>> b8a4b36a2fc5f243140ffdb4daadbf25797ec4fa
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: ProductView(),
=======
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteColor,
      ),
      routerConfig:AppRouter.router ,
>>>>>>> b8a4b36a2fc5f243140ffdb4daadbf25797ec4fa
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     scaffoldBackgroundColor: kWhiteColor,
    //   ),
    //   routerConfig: AppRouter.router,
    // );
  }
}
