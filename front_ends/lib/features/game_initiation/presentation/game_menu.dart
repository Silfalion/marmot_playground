import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:marmot_playground/common_widgets/marmot_appbar.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/features/game_initiation/presentation/widgets/request_button.dart';
import 'package:marmot_playground/theme/adaptive_color_generator.dart';
import 'package:marmot_playground/theme/app_theme.dart';
import 'package:marmot_playground/theme/button_styles.dart';
import 'package:marmot_playground/theme/gaps.dart';
import 'package:marmot_playground/theme/text_style.dart';
import 'package:marmot_playground/utils/repositories_quick_call.dart';
import 'package:progress_state_button/progress_button.dart';

///menu where the user chooses a game to play
class GameMenu extends StatelessWidget {
  const GameMenu({super.key, required this.gameData});

  final GameData gameData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameMenuCubit, GameMenuState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {},
        );
      },
      child: Scaffold(
        appBar: const MarmotAppBar(),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl: getGameManagementRepository(context)
                      .imageUrl(gameData.imageId),
                ),
                Text(
                  gameData.gameTitle,
                  style: TextStyle(fontSize: enormousTextSize),
                ),
                bigVGap,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rules:',
                    style: TextStyle(
                      fontSize: bigTextSize,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                bigVGap,
                if (gameData.description.isEmpty)
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/shrugging_man.svg',
                        height: 200,
                        color: adaptiveColorGenerator(
                          context,
                          lightColor,
                          darkColor,
                        ),
                      ),
                      averageVGap,
                      Text(
                        'Everything is fair game, I guess',
                        style: TextStyle(fontSize: normalTextSize),
                      )
                    ],
                  )
                else
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 200,
                      child: Text(gameData.description),
                    ),
                  ),
                bigVGap,
                Row(
                  children: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      style: TextButton.styleFrom(
                        backgroundColor: adaptiveColorGenerator(
                          context,
                          lightColor,
                          darkColor,
                        ),
                        primary: adaptiveColorGenerator(
                          context,
                          darkColor,
                          lightColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(buttonCornerRadius),
                        ),
                        textStyle: TextStyle(
                          fontSize: normalTextSize,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                      ),
                      child: Text(
                        'Go back to games list',
                        style: TextStyle(fontSize: normalTextSize),
                      ),
                    ),
                    averageHGap,
                    const Flexible(child: GameMenuProgressButton()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
