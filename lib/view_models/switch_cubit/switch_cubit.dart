import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(true);

  void onChanged({bool? isOn}) {
    debugPrint(
        'SwitchCubit | onChanged | isOn: $isOn changed state: ${!state}');
    emit(isOn ?? !state);
  }
}
