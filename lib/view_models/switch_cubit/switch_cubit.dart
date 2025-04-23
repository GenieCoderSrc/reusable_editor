import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial(isOn: true));

  void onChanged({bool? isOn}) {
    final newState = isOn ?? !(state as SwitchInitial).isOn;
    debugPrint('SwitchCubit | onChanged | isOn: $isOn changed state: $newState');
    emit(SwitchInitial(isOn: newState));
  }

  void clearSwitch() {
    debugPrint('SwitchCubit | clearSwitch | reset to true');
    emit(SwitchInitial(isOn: true));
  }
}
