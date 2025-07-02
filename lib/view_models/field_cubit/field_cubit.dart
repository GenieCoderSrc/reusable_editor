import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_validator/i_validator.dart';

part 'field_state.dart';

class FieldCubit<T> extends Cubit<FieldState<T>> {
  final FieldState<T> _initialState;

  FieldCubit({T? initialValue, IValidator<T>? validator})
    : _initialState = FieldState<T>(value: initialValue, validator: validator),
      super(FieldState<T>(value: initialValue, validator: validator));

  void update(T? value) {
    final error = state.validator?.validate(value as T);
    emit(state.copyWith(value: value, errorText: error));
  }

  String? validate() {
    final error = state.validator?.validate(state.value as T);
    emit(state.copyWith(errorText: error));
    return error;
  }

  void clear() => emit(state.init());

  void reset() => emit(_initialState); // ✅ Resets to original initial value
}
