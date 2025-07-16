import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_validator/i_validator.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  final bool _initialValue;
  final IValidator<bool>? _validator;

  SwitchCubit({bool initialValue = true, IValidator<bool>? validator})
    : _initialValue = initialValue,
      _validator = validator,
      super(
        SwitchState(
          isOn: initialValue,
          fieldError: validator?.validate(initialValue),
        ),
      );

  /// Toggles the switch or sets explicitly, then validates (if validator exists).
  void toggle({bool? isOn}) {
    final newValue = isOn ?? !state.isOn;
    final error = _validator?.validate(newValue);

    emit(state.copyWith(isOn: newValue, fieldError: error));
    debugPrint('SwitchCubit | toggle | isOn: $newValue | error: $error');
  }

  /// Resets the switch to its initial state and revalidates (if validator exists).
  void reset() {
    final error = _validator?.validate(_initialValue);
    emit(state.copyWith(isOn: _initialValue, fieldError: error));
    debugPrint('SwitchCubit | reset | isOn: $_initialValue');
  }

  /// Manually triggers validation for the current value.
  void validate() {
    final error = _validator?.validate(state.isOn);
    emit(state.copyWith(fieldError: error));
    debugPrint(
      'SwitchCubit | validate | current isOn: ${state.isOn} | error: $error',
    );
  }
}
