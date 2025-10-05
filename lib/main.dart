import 'package:devvibe_template/core/di/service_locator.dart';
import 'package:devvibe_template/core/router/app_router.dart' as AppRouter;
import 'package:devvibe_template/core/theme/app_theme.dart';
import 'package:devvibe_template/core/theme/bloc/theme_bloc.dart';
import 'package:devvibe_template/core/theme/bloc/theme_event.dart';
import 'package:devvibe_template/core/theme/bloc/theme_state.dart';
import 'package:devvibe_template/core/theme/domain/entity/app_theme_mode.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_event.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_state.dart';
import 'package:devvibe_template/firebase_options.dart';
import 'package:devvibe_template/l10n/bloc/locale_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'l10n/app_localizations.dart' show AppLocalizations;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()..add(GetCurrentUserEvent())),
        BlocProvider(create: (_) => sl<ThemeBloc>()..add(LoadTheme())),
        BlocProvider(create: (_) => sl<LocaleCubit>()..loadLocale()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.logout) {
                    AppRouter.router.go('/auth');
                  }
                },
                child: MaterialApp.router(
                  title: 'DevVibe Template',
                  debugShowCheckedModeBanner: false,
                  darkTheme: AppTheme.darkTheme,
                  theme: AppTheme.lightTheme,
                  themeMode: themeState.themeMode == AppThemeMode.dark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  locale: locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en'), Locale('es')],
                  routerConfig: AppRouter.router,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
