import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_form_cubit_state.dart';
part 'information_form_cubit_cubit.freezed.dart';

class InformationFormCubitCubit extends Cubit<InformationFormCubitState> {
  InformationFormCubitCubit()
      : super(const InformationFormCubitState.initial());
}
