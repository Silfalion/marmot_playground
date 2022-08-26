// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:marmot_playground/app/splash_screen/cubit/splash_cubit.dart';
import 'package:marmot_playground/app/splash_screen/splash_page.dart';
import 'package:marmot_playground/features/initialzation/presentation/cubit/loading_cubit.dart';
import 'package:marmot_playground/l10n/l10n.dart';
import 'package:marmot_playground/theme/app_theme.dart';
import 'package:appwrite/appwrite.dart';

class App extends StatelessWidget {
  App({super.key});

  final Client client = Client();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MatchmakingRepository(client: client),
        ),
        RepositoryProvider(
          create: (context) => GameManagementRepository(client: client),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoadingCubit(),
          ),
        ],
        child: AdaptiveTheme(
          initial: AdaptiveThemeMode.light,
          light: buildLightTheme(),
          dark: buildDarkTheme(),
          builder: (light, dark) => MaterialApp(
            theme: light,
            darkTheme: dark,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: BlocProvider(
              create: (context) => SplashCubit(
                RepositoryProvider.of<MatchmakingRepository>(context),
                RepositoryProvider.of<GameManagementRepository>(context),
              ),
              child: const SplashPage(),
            ),
          ),
        ),
      ),
    );
  }
}
