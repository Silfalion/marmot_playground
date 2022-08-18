import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marmot_playground/exceptions/city_fetching_exception.dart';

part 'loading_cubit_state.dart';
part 'loading_cubit.freezed.dart';

class LoadingCubit extends Cubit<LoadingCubitState> {
  LoadingCubit() : super(const LoadingCubitState.initial());
  Future<void> loadCities() async {
    emit(const LoadingCubitState.loading());

 
  }
}
