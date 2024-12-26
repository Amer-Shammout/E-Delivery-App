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
  static const kRegisterationView = '/registerationView';
  static const kVerificationView = '/verificationView';
  static const kSettingInfoView = '/settingInfoView';
  static const kHomeView = '/homeView';
  static const kAppRoot = '/appRoot';
  static const kStoreDetailsView = '/storeDetails';
  static const kProfileView = '/profileView';
  static const kSearchView = '/searchView';
  static const kProductDetailsView = '/productDetailsView';
  static const kCartView = '/CartView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LetsGetStartedView(),
      ),
      GoRoute(
        path: kRegisterationView,
        builder: (context, state) => const RegisterationView(),
      ),
      GoRoute(
        path: kVerificationView,
        builder: (context, state) => const VerificationView(),
      ),
      GoRoute(
        path: kSettingInfoView,
        builder: (context, state) => const SettingInfoView(),
      ),
      GoRoute(
        path: kAppRoot,
        builder: (context, state) => const AppWithNavBar(),
      ),
      GoRoute(
        path: kStoreDetailsView,
        builder: (context, state) => const StoreDetailsView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
