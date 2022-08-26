import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/cubit/game_choice_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/game_menu.dart';
import 'package:marmot_playground/theme/gaps.dart';

///menu where the user chooses a game to play
class GameChoicePage extends StatelessWidget {
  const GameChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameChoiceCubit, GameChoiceState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Games'),
                const Divider(),
                bigVertGap,
                Expanded(
                  child: state.when(
                    initial: SizedBox.new,
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    failed: (e) => Center(
                      child: Text(e.toString()),
                    ),
                    success: (games) {
                      if (games.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Nothing to see here apparently'),
                              ElevatedButton(
                                onPressed: () =>
                                    BlocProvider.of<GameChoiceCubit>(context)
                                        .fetchGames(),
                                child: const Text('Refresh'),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Wrap(
                          children: games
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (context) => BlocProvider(
                                            create: (context) => GameMenuCubit(
                                              RepositoryProvider.of<
                                                  MatchmakingRepository>(
                                                context,
                                              ),
                                            ),
                                            child: const GameMenu(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      child: Column(
                                        children: [
                                          const Placeholder(),
                                          Text(e.gameTitle)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }
                    },
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
