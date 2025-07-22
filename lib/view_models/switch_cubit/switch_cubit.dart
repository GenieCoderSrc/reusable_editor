import 'package:flutter/foundation.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

class SwitchCubit extends FieldCubit<bool> {
  final bool _initialValue;

  SwitchCubit({bool super.initialValue = true, super.validator})
    : _initialValue = initialValue;

  /// Toggle the value or set explicitly, then validate.
  void toggle({bool? value}) {
    final newValue = value ?? !(state.value ?? false);
    update(newValue);
    debugPrint(
      'SwitchCubit | toggle | value: $newValue | error: ${state.errorText}',
    );
  }

  /// Reset to the initial value and validate.
  void reset() {
    update(_initialValue);
    debugPrint('SwitchCubit | reset | value: $_initialValue');
  }
}

//
// part 'switch_state.dart';
// class SwitchCubit extends Cubit<SwitchState> {
//   final bool _initialValue;
//   final IValidator<bool>? _validator;
//
//   SwitchCubit({bool initialValue = true, IValidator<bool>? validator})
//     : _initialValue = initialValue,
//       _validator = validator,
//       super(
//         SwitchState(
//           isOn: initialValue,
//           fieldError: validator?.validate(initialValue),
//         ),
//       );
//
//   /// Toggles the switch or sets explicitly, then validates (if validator exists).
//   void toggle({bool? isOn}) {
//     final newValue = isOn ?? !state.isOn;
//     final error = _validator?.validate(newValue);
//
//     emit(state.copyWith(isOn: newValue, fieldError: error));
//     debugPrint('SwitchCubit | toggle | isOn: $newValue | error: $error');
//   }
//
//   /// Resets the switch to its initial state and revalidates (if validator exists).
//   void reset() {
//     final error = _validator?.validate(_initialValue);
//     emit(state.copyWith(isOn: _initialValue, fieldError: error));
//     debugPrint('SwitchCubit | reset | isOn: $_initialValue');
//   }
//
//   /// Manually triggers validation for the current value.
//   void validate() {
//     final error = _validator?.validate(state.isOn);
//     emit(state.copyWith(fieldError: error));
//     debugPrint(
//       'SwitchCubit | validate | current isOn: ${state.isOn} | error: $error',
//     );
//   }
// }
