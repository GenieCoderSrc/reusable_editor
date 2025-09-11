import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reusable_editor/type_def/type_def.dart';

part 'field_state.dart';

class FieldCubit<T> extends Cubit<FieldState<T>> {
  final FieldState<T> _initialState;

  FieldCubit({T? initialValue, FieldValidator<T>? validator})
      : _initialState = FieldState<T>(
    value: initialValue,
    validator: validator,
    errorText: null,
    isDirty: false,
  ),
        super(
        FieldState<T>(
          value: initialValue,
          validator: validator,
          errorText: null,
          isDirty: false,
        ),
      );

  void onChanged(T? value) {
    final error = state.validator?.call(value);
    emit(
      state.copyWith(
        value: value,
        errorText: error,
        isDirty: true,
      ),
    );
  }

  String? validate({bool force = false}) {
    final shouldValidate = force || state.isDirty;
    final error = shouldValidate ? state.validator?.call(state.value) : null;

    emit(
      state.copyWith(
        errorText: shouldValidate ? error : null,
        isDirty: shouldValidate,
      ),
    );
    return error;
  }

  FormFieldValidator<T> get formFieldValidator =>
          (value) => _validateAndEmit(value);

  void clear() => emit(state.init());

  void reset() => emit(_initialState);

  String? _validateAndEmit(T? value) {
    final error = state.validator?.call(value);
    emit(
      state.copyWith(
        errorText: error,
        isDirty: true,
      ),
    );
    return error;
  }
}

