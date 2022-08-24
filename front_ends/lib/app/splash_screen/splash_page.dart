import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marmot_playground/app/splash_screen/cubit/splash_cubit.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
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
                      create: (context) => GameMenuCubit(
                        RepositoryProvider.of<MatchmakingRepository>(
                          context,
                        ),
                      ),
                      child: const GameMenu(),
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
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    'assets/resized_marmot_cropped.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: state.when(
                      initial: () => const Text('Loading'),
                      loaded: () => const Text('Welcome'),
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
