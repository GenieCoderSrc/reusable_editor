import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/type_def/type_def.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  final TextEditingController controller;
  final String? _initialValue;

  TextFieldCubit({String? initialValue, TextFieldValidator? validator})
    : _initialValue = initialValue,
      controller = TextEditingController(text: initialValue),
      super(
        TextFieldState.initial(
          initialValue: initialValue,
          validator: validator,
        ),
      ) {
    controller.addListener(_handleTextChanged);
  }

  void _handleTextChanged() {
    final value = controller.text;
    if (value != state.value) {
      final error = state.isDirty ? state.validator?.call(value) : null;
      emit(state.copyWith(value: value, errorText: error, isDirty: true));
    }
  }

  void onChanged(String? value) {
    final newValue = value?.trim() ?? '';
    if (newValue != state.value) {
      controller.text = newValue;
      controller.selection = TextSelection.collapsed(offset: newValue.length);
      final error = state.isDirty ? state.validator?.call(newValue) : null;
      emit(state.copyWith(value: newValue, errorText: error, isDirty: true));
    }
  }

  String? validate({bool force = false}) {
    // If force is true (create), validate all
    // If force is false (update), validate only dirty fields
    final shouldValidate = force || state.isDirty;
    final error = shouldValidate ? state.validator?.call(state.value) : null;
    emit(
      state.copyWith(
        errorText: error,
        isDirty: shouldValidate || state.isDirty,
      ),
    );
    return error;
  }

  FormFieldValidator<String> get formFieldValidator =>
      (value) => validate();

  void reset({bool validate = false}) {
    controller.text = _initialValue ?? '';
    controller.selection = TextSelection.collapsed(
      offset: _initialValue?.length ?? 0,
    );

    final error = validate ? state.validator?.call(_initialValue) : null;
    emit(
      state.copyWith(value: _initialValue, errorText: error, isDirty: false),
    );
  }

  void clear() {
    controller.clear();
    emit(state.copyWith(value: null, errorText: null, isDirty: false));
  }

  void dispose() {
    controller.removeListener(_handleTextChanged);
    controller.dispose();
  }
}
