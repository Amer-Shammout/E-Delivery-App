import 'package:e_delivery_app/Core/services/custom_bloc_observer.dart';
import 'package:e_delivery_app/Core/services/firebase_notification.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_theme.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/manager/setting_info_cubit/setting_info_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/localization_cubit/localization_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/firebase_options.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification.getFCMToken();
  Bloc.observer = CustomBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Prefs.init();

  setupGetit();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return BetterFeedback(
            themeMode: mode,
            darkTheme: AppTheme.darkFeedbackThemeData(),
            theme: AppTheme.lightFeedbackThemeData(),
            child: const EDelivery(),
          );
        },
      ),
    ),
  );
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LocalizationCubit(),
        ),
        BlocProvider(
          create: (context) => SettingInfoCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, String>(
        builder: (context, lang) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return MaterialApp.router(
                locale: Locale(setLocale(lang, context)),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                themeMode: mode,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                routerConfig: AppRouter.router,
                // home: const CartView(),
              );
            },
          );
        },
      ),
    );
  }

  String setLocale(String lang, context) {
    switch (lang) {
      case "English":
        return 'en';
      case "العربيّة":
        return 'ar';
      default:
        return Localizations.localeOf(context).languageCode;
    }
  }
}
