import 'package:e_delivery_app/Core/widgets/app_with_nav_bar.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/cart_view.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/product_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/search_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/store_details_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLetsGetStartedView = '/letsGetStartedView';
  static const kLetsGetStartedName = '/letsGetStartedView';
  static const kRegisterationView = '/registerationView';
  static const kRegisterationName = '/registerationView';
  static const kVerificationView = '/verificationView/:phoneNumber';
  static const kVerificationName = '/verificationView/:phoneNumber';
  static const kSettingInfoView = '/settingInfoView';
  static const kSettingInfoName = '/settingInfoView';
  static const kHomeView = '/homeView';
  static const kHomeName = '/homeView';
  static const kAppRoot = '/appRoot';
  static const kAppRootName = '/appRoot';
  static const kStoreDetailsView = '/storeDetails';
  static const kStoreDetailsName = '/storeDetails';
  static const kProfileView = '/profileView';
  static const kProfileName = '/profileView';
  static const kSearchView = '/searchView';
  static const kSearchName = '/searchView';
  static const kProductDetailsView = '/productDetailsView';
  static const kProductDetailsName = '/productDetailsView';
  static const kCartView = '/CartView';
  static const kCartName = '/CartView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        name: kLetsGetStartedName,
        path: '/',
        builder: (context, state) => const LetsGetStartedView(),
      ),
      GoRoute(
        path: kRegisterationView,
        name: kRegisterationName,
        builder: (context, state) => const RegisterationView(),
      ),
      GoRoute(
        path: kVerificationView,
        name: kVerificationName,
        builder: (context, state) => VerificationView(
          phoneNumber: state.pathParameters['phoneNumber']!,
        ),
      ),
      GoRoute(
        path: kSettingInfoView,
        name: kSettingInfoName,
        builder: (context, state) => const SettingInfoView(),
      ),
      GoRoute(
        path: kAppRoot,
        name: kAppRootName,
        builder: (context, state) => const AppWithNavBar(),
      ),
      GoRoute(
        path: kStoreDetailsView,
        name: kStoreDetailsName,
        builder: (context, state) => const StoreDetailsView(),
      ),
      GoRoute(
        path: kProfileView,
        name: kProfileName,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kSearchView,
        name: kSearchName,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        name: kProductDetailsName,
        builder: (context, state) => const ProductView(),
      ),
      GoRoute(
        path: kCartView,
        name: kCartName,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
