import 'package:e_delivery_app/Core/Data/Manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo_impl.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_body.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddToCartCubit(getIt.get<AppRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => RemoveFromCartCubit(getIt.get<AppRepoImpl>()),
        ),
        BlocProvider<GetStoreProductsCubit>.value(
          value: getIt.get<GetStoreProductsCubit>(),
          // create: (context) => getIt.get<GetStoreProductsCubit>(),
        ),
      ],
      child: Container(
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
      ),
    );
  }
}
