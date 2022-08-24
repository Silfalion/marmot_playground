// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marmot_playground/app/splash_screen/cubit/splash_cubit.dart';
import 'package:marmot_playground/app/splash_screen/splash_page.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/features/initialzation/presentation/cubit/loading_cubit.dart';
import 'package:marmot_playground/features/initialzation/presentation/loading_screen.dart';
import 'package:marmot_playground/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MatchmakingRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoadingCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider(
            create: (context) => SplashCubit(
              RepositoryProvider.of<MatchmakingRepository>(context),
            ),
            child: const SplashPage(),
          ),
        ),
      ),
    );
  }
}
