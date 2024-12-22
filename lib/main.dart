import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_theme.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const BetterFeedback(child: EDelivery()));
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return BetterFeedback(
            themeMode: mode,
            darkTheme: AppTheme.darkFeedbackThemeData(context),
            theme: AppTheme.lightFeedbackThemeData(context),
            child: MaterialApp.router(
              themeMode: mode,
              darkTheme: AppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              routerConfig: AppRouter.router,
            ),
          );
        },
      ),
    );
  }
}
// class EDelivery extends StatelessWidget {
//   const EDelivery({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => ThemeCubit(),
//         ),
//       ],
//       child: BlocBuilder<ThemeCubit, ThemeMode>(
//         builder: (context, mode) {
//           return MaterialApp(
//             themeMode: mode,
//             darkTheme: AppTheme.darkTheme,
//             debugShowCheckedModeBanner: false,
//             theme:AppTheme.lightTheme,
//             home: CartView(),
//             // routerConfig: AppRouter.router,
//           );
//         },
//       ),
//     );
//   }
// }
