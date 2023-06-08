import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/routes/app_router.dart';
import 'core/utils/services/shared_preferences.dart';
import 'features/auth/login/presentation/screens/login_screen.dart';
import 'features/hompage_navigation/presentation/bloc/cubit/navigation_cubit.dart';
import 'features/localization/cubit/lacalization_cubit.dart';
import 'features/localization/localize_app_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  await Future.delayed(const Duration(seconds: 3));
  runApp(
      //   DevicePreview(
      //   builder: (context) => MyApp(
      //     appRouter: AppRouter(),
      //   ),
      // ));
      MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

//singelton
  const MyApp._internal({required this.appRouter});
  static MyApp? _instance;
  factory MyApp({required appRouter}) {
    _instance ??= MyApp._internal(appRouter: appRouter);
    return _instance!;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) =>
              LacalizationCubit(LocalizeAppImpl())..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LacalizationCubit, LacalizationState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Alwafeer',
            // useInheritedMediaQuery: true,
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute: LoginScreen.routeName,
            theme: ThemeData(fontFamily: 'Cairo'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
          );
        },
      ),
    );
  }
}
