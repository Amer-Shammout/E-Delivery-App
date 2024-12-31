import 'dart:developer';

import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo_impl.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/widgets/app_with_nav_bar.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/register_cubit/register_cubit.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/resend_code/resend_code_cubit.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/cart_view.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/product_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_image_cubit/update_image_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_location_cubit/update_location_cubit.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/manager/update_name_cubit/update_name_cubit.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo_impl.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/search_view.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/Views/store_details_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLetsGetStartedView = '/';
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

  static bool isAuth = Prefs.getString(kToken) != '';

  static final router = GoRouter(
    // initialLocation: isAuth ? kAppRoot : kLetsGetStartedView,
    routes: [
      GoRoute(
        name: kLetsGetStartedName,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LetsGetStartedView()),
      ),
      GoRoute(
        path: kRegisterationView,
        name: kRegisterationName,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
            child: const RegisterationView(),
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
          return MaterialPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      GetUserCubit(getIt.get<AppRepoImpl>())..getUser(),
                )
              ],
              child: AppWithNavBar(
                user: state.extra as User,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: kStoreDetailsView,
        name: kStoreDetailsName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: StoreDetailsView()),
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
        )),
      ),
      GoRoute(
        path: kSearchView,
        name: kSearchName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SearchView()),
      ),
      GoRoute(
        path: kProductDetailsView,
        name: kProductDetailsName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProductView()),
      ),
      GoRoute(
        path: kCartView,
        name: kCartName,
        pageBuilder: (context, state) => const MaterialPage(child: CartView()),
      ),
    ],
    redirect: (context, state) {
      // bool isAuth = Prefs.getString(kToken) != '';
      // log(Prefs.getString(kToken));
      // if (isAuth && state.namedLocation(kLetsGetStartedName) == '/') {
      //   log(state.namedLocation(kLetsGetStartedName));
      //   return kAppRoot;
      // } else {
      //   return null;
      // }
    },
  );
}
