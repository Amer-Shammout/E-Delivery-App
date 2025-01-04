import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    SystemChrome.restoreSystemUIOverlays();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        image: DecorationImage(
          matchTextDirection: true,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
          fit: BoxFit.cover,
          image: const AssetImage(
            Assets.imagesProductCard,
          ),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ProductViewBody(productModel: widget.productModel),
        ),
      ),
    );
  }
}
