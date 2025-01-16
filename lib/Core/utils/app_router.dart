import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/widgets/app_with_nav_bar.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registration_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/resend_code/resend_code_cubit.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/cart_view_builder.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/submit_the_order_cubit/submit_the_order_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/update_cart_cubit/update_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo_impl.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/product_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_image_cubit/update_image_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_location_cubit/update_location_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_name_cubit/update_name_cubit.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo_impl.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/all_products_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/all_stores_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/search_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/store_details_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_categories_cubit/get_store_categories_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/data/repos/store_details_repo_impl.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLetsGetStartedView = '/';
  static const kLetsGetStartedName = 'letsGetStartedView';
  static const kRegistrationView = '/registrationView';
  static const kRegistrationName = 'registrationView';
  static const kVerificationView = '/verificationView/:phoneNumber';
  static const kVerificationName = 'verificationView';
  static const kSettingInfoView = '/settingInfoView';
  static const kSettingInfoName = 'settingInfoView';
  static const kHomeView = '/homeView';
  static const kHomeName = 'homeView';
  static const kAppRoot = '/appRoot';
  static const kAppRootName = 'appRoot';
  static const kStoreDetailsView = '/storeDetails';
  static const kStoreDetailsName = 'storeDetails';
  static const kProfileView = '/profileView';
  static const kProfileName = 'profileView';
  static const kSearchView = '/searchView';
  static const kSearchName = 'searchView';
  static const kProductDetailsView = '/productDetailsView';
  static const kProductDetailsName = 'productDetailsView';
  static const kCartView = '/CartView';
  static const kCartName = 'CartView';
  static const kAllStoresView = '/allStoresView';
  static const kAllStoresName = 'allStoresView';
  static const kAllProductsView = '/allProductsView';
  static const kAllProductsName = 'allProductsView';

  static bool isAuth = Prefs.getString(kToken) != '';

  static final router = GoRouter(
    initialLocation: isAuth ? kAppRoot : kLetsGetStartedView,
    routes: [
      GoRoute(
        name: kLetsGetStartedName,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LetsGetStartedView()),
      ),
      GoRoute(
        path: kRegistrationView,
        name: kRegistrationName,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
            child: const RegistrationView(),
          ),
        ),
      ),
      GoRoute(
        path: kVerificationView,
        name: kVerificationName,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    VerificationCubit(getIt.get<AuthRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => ResendCodeCubit(getIt.get<AuthRepoImpl>()),
              ),
            ],
            child: VerificationView(
              phoneNumber: state.pathParameters['phoneNumber']!,
            ),
          ),
        ),
      ),
      GoRoute(
        path: kSettingInfoView,
        name: kSettingInfoName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SettingInfoView()),
      ),
      GoRoute(
        path: kAppRoot,
        name: kAppRootName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: AppWithNavBar(),
          );
        },
      ),
      GoRoute(
        path: kStoreDetailsView,
        name: kStoreDetailsName,
        pageBuilder: (context, state) => MaterialPage(
            child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetStoreCategoriesCubit(
                getIt.get<StoreDetailsRepoImpl>(),
              ),
            ),
            BlocProvider<GetStoreProductsCubit>.value(
              value: getIt.get<GetStoreProductsCubit>(),
              // create: (context) => getIt.get<GetStoreProductsCubit>(),
            ),
          ],
          child: StoreDetailsView(
            storeModel: state.extra as StoreModel,
          ),
        )),
      ),
      GoRoute(
        path: kProfileView,
        name: kProfileName,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LogoutCubit(getIt.get<ProfileRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    UpdateNameCubit(getIt.get<ProfileRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    UpdateLocationCubit(getIt.get<ProfileRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    UpdateImageCubit(getIt.get<ProfileRepoImpl>()),
              ),
            ],
            child: const ProfileView(),
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        name: kSearchName,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
            child: const SearchView(),
          ),
        ),
      ),
      GoRoute(
        path: kProductDetailsView,
        name: kProductDetailsName,
        pageBuilder: (context, state) => MaterialPage(
            child: ProductView(
          productModel: state.extra as ProductModel?,
        )),
      ),
      GoRoute(
        path: kCartView,
        name: kCartName,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCartCubit(getIt.get<CartRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    SubmitTheOrderCubit(getIt.get<CartRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => UpdateCartCubit(getIt.get<CartRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    EditQuantityCubit(const CartItemQuantity(orderItems: [])),
              ),
            ],
            child: const CartViewBuilder(),
          ),
        ),
      ),
      GoRoute(
        path: kAllProductsView,
        name: kAllProductsName,
        pageBuilder: (context, state) => MaterialPage(
          child: AllProductsView(
            searchSuccess: state.extra as SearchSuccess,
          ),
        ),
      ),
      GoRoute(
        path: kAllStoresView,
        name: kAllStoresName,
        pageBuilder: (context, state) => MaterialPage(
          child: AllStoresView(
            stores: state.extra as List<StoreModel>,
          ),
        ),
      ),
    ],
  );
}
