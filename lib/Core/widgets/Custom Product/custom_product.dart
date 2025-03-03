import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_delivery_app/Core/Data/Manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo_impl.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_content.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_price.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct(
      {super.key,
      @required this.productModel,
      required this.index,
      this.getProductsSuccess,
      this.getStoreProductsSuccess,
      this.getSearchProductsSuccess});

  final ProductModel? productModel;
  final int index;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AddToCartCubit(getIt.get<AppRepoImpl>())),
        BlocProvider(
            create: (context) => RemoveFromCartCubit(getIt.get<AppRepoImpl>())),
      ],
      child: CustomContainer(
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 8, end: 4, top: 8, bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                matchTextDirection: true,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
                fit: BoxFit.fill,
                image: const AssetImage(
                  Assets.imagesHomeCard,
                )),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  productModel?.discountValue != null
                      ? Text(
                          S.of(context).hot,
                          style: AppStyles.fontsBold10(context).copyWith(
                              color: Theme.of(context).colorScheme.tertiary),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Center(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: productModel == null
                      ? Image.asset(
                          Assets.imagesIphoneTest,
                          fit: BoxFit.scaleDown,
                        )
                      : CachedNetworkImage(
                          imageUrl: productModel!.imageUrl!,
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Theme.of(context).colorScheme.tertiary,
                            size: 24,
                          ),
                        ),
                ),
              ),
              const Spacer(),
              ProductContent(productModel: productModel),
              const Spacer(
                flex: 2,
              ),
              ProductPrice(
                productModel: productModel,
                index: index,
                getProductsSuccess: getProductsSuccess,
                getSearchProductsSuccess: getSearchProductsSuccess,
                getStoreProductsSuccess: getStoreProductsSuccess,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
