import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marmot_playground/features/initialzation/presentation/cubit/loading_cubit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoadingCubit, LoadingCubitState>(
        builder: (context, state) => state.when(
          initial: () => const Text('Initial'),
          loading: () => Column(
            children: const [
              Text('Loading'),
              CircularProgressIndicator(),
            ],
          ),
          loaded: () => const Text('Loaded'),
          failed: (e) => const Text('Failed'),
        ),
      ),
    );
  }
}
