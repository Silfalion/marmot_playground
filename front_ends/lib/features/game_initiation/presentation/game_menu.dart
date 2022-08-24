import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marmot_playground/features/game_initiation/application/cubit/game_menu_cubit.dart';
import 'package:progress_state_button/progress_button.dart';

///menu where the user chooses a game to play
class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameMenuCubit, GameMenuState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              GameMenuProgressButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class GameMenuProgressButton extends StatelessWidget {
  const GameMenuProgressButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameMenuCubit, GameMenuState>(
      builder: (context, state) {
        return ProgressButton(
          stateWidgets: const {
            ButtonState.idle: Text('hi'),
            ButtonState.fail: Text('hi'),
            ButtonState.success: Text('hi'),
            ButtonState.loading: Text('hi'),
          },
          stateColors: {
            ButtonState.idle: Colors.grey.shade400,
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
