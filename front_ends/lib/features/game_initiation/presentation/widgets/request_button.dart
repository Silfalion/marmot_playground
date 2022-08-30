import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:marmot_playground/theme/button_styles.dart';
import 'package:marmot_playground/theme/text_style.dart';
import 'package:progress_state_button/progress_button.dart';

class GameMenuProgressButton extends StatelessWidget {
  const GameMenuProgressButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameMenuCubit, GameMenuState>(
      builder: (context, state) {
        return ProgressButton(
          stateWidgets: Map.fromEntries(
            ButtonState.values.map((e) {
              switch (e) {
                case ButtonState.idle:
                  return MapEntry(
                    e,
                    const ButtonMessage(text: 'Look for a match?'),
                  );

                case ButtonState.loading:
                  return MapEntry(
                    e,
                    const ButtonMessage(text: 'Looking for matches'),
                  );

                case ButtonState.success:
                  return MapEntry(e, const ButtonMessage(text: 'Found one!'));

                case ButtonState.fail:
                  return MapEntry(
                    e,
                    const ButtonMessage(text: 'A problem occured, retry?'),
                  );
              }
            }),
          ),
          stateColors: {
            ButtonState.idle: const Color(0xffFF9B42),
            ButtonState.loading: Colors.blue.shade300,
            ButtonState.fail: Colors.red.shade300,
            ButtonState.success: Colors.green.shade400,
          },
          state: state.when(
            idle: () => ButtonState.idle,
            loading: () => ButtonState.loading,
            fail: () => ButtonState.fail,
            success: () => ButtonState.success,
          ),
          progressIndicatorSize: 20,
          radius: buttonCornerRadius,
          minWidthStates: const [],
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          onPressed: () {
            state.maybeWhen(
              loading: null,
              orElse: () => BlocProvider.of<GameMenuCubit>(context)
                  .makeMatchmakingRequest(),
            );
          },
        );
      },
    );
  }
}

class ButtonMessage extends StatelessWidget {
  const ButtonMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: normalTextSize),
    );
  }
}
