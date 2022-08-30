import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:marmot_playground/common_widgets/marmot_appbar.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/cubit/game_choice_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/game_menu.dart';
import 'package:marmot_playground/theme/app_theme.dart';
import 'package:marmot_playground/theme/gaps.dart';
import 'package:marmot_playground/theme/text_style.dart';

///menu where the user chooses a game to play
class GameChoicePage extends StatelessWidget {
  const GameChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarmotAppBar(),
      body: BlocBuilder<GameChoiceCubit, GameChoiceState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Games',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Divider(
                    color: lightColor,
                  ),
                  bigVertGap,
                  bigVertGap,
                  state.when(
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
                                (game) => TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (context) => BlocProvider(
                                          create: (context) => GameMenuCubit(
                                            RepositoryProvider.of<
                                                MatchmakingRepository>(
                                              context,
                                            ),
                                          ),
                                          child: GameMenu(
                                            gameData: game,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: CachedNetworkImage(
                                            imageUrl: RepositoryProvider.of<
                                                GameManagementRepository>(
                                              context,
                                            ).imageUrl(game.imageId),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            game.gameTitle,
                                            style: TextStyle(
                                              fontSize: normalTextSize,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }
                    },
                  ),
                  bigVertGap
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
