import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:marmot_playground/app/splash_screen/cubit/splash_cubit.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/cubit/game_choice_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/game_choice_page.dart';
import 'package:marmot_playground/features/game_initiation/presentation/game_menu.dart';
import 'package:marmot_playground/theme/gaps.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        bloc: BlocProvider.of<SplashCubit>(context)..loadStuff(),
        listener: (context, state) {
          state.whenOrNull(
            loaded: () {
              Future<void>.delayed(
                const Duration(seconds: 1),
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => GameChoiceCubit(
                        RepositoryProvider.of<GameManagementRepository>(
                          context,
                        ),
                      )..fetchGames(),
                      child: const GameChoicePage(),
                    ),
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? const Icon(Icons.light_mode)
                            : const Icon(Icons.mode_night),
                    onPressed: () {
                      if (AdaptiveTheme.of(context).mode ==
                          AdaptiveThemeMode.dark) {
                        AdaptiveTheme.of(context).setLight();
                      } else {
                        AdaptiveTheme.of(context).setDark();
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'assets/resized_marmot.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: state.when(
                      initial: () => const InitialMessage(message: '...'),
                      sessionCreation: () => const InitialMessage(
                        message: 'Creating anonymous session...',
                      ),
                      settingUpDBConnection: () => const InitialMessage(
                        message: 'Setting up database connection...',
                      ),
                      loaded: () => const InitialMessage(
                        message: 'Welcome to the Marmot Playground',
                      ),
                      failed: (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(e.toString()),
                          ElevatedButton(
                            onPressed:
                                BlocProvider.of<SplashCubit>(context).loadStuff,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class InitialMessage extends StatelessWidget {
  const InitialMessage({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
