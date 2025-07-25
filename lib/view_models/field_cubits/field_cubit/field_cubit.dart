import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reusable_editor/type_defs/type_defs.dart';

part 'field_state.dart';

class FieldCubit<T> extends Cubit<FieldState<T>> {
  final FieldState<T> _initialState;

  FieldCubit({T? initialValue, FieldValidator<T>? validator})
    : _initialState = FieldState<T>(
        value: initialValue,
        validator: validator,
        errorText: validator?.call(initialValue),
      ),
      super(
        FieldState<T>(
          value: initialValue,
          validator: validator,
          errorText: validator?.call(initialValue),
        ),
      );

  void onChanged(T? value) {
    final error = state.validator?.call(value);
    emit(state.copyWith(value: value, errorText: error));
  }

  String? validate() => _validateAndEmit(state.value);

  FormFieldValidator<T> get formFieldValidator => _validateAndEmit;

  void clear() => emit(state.init());

  void reset() => emit(_initialState);

  String? _validateAndEmit(T? value) {
    final error = state.validator?.call(value);
    emit(state.copyWith(errorText: error));
    return error;
  }
}
