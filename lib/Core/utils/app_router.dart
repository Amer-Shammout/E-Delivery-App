import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLetsGetStartedView = '/letsGetStartedView';
  static const kRegisterationView = '/registerationView';
  static const kVerificationView = '/verificationView';
  static const kSettingInfoView = '/settingInfoView';
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';

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
    ],
  );
}
