import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // Keep Cubit state updated when user types
    final value = controller.text;
    if (value != state.value) {
      final error = state.validator?.call(value);
      emit(state.copyWith(value: value, errorText: error));
    }
  }

  void onChanged(String? value) {
    final newValue = value?.trim() ?? '';
    // Update Cubit + TextController together
    if (newValue != state.value) {
      controller.text = newValue;
      controller.selection = TextSelection.collapsed(offset: newValue.length);
      final error = state.validator?.call(newValue);
      emit(state.copyWith(value: newValue, errorText: error));
    }
  }

  String? validate(String? value) {
    final error = state.validator?.call(value ?? state.value);
    emit(state.copyWith(errorText: error));
    return error;
  }

  void reset({bool validate = false}) {
    controller.text = _initialValue ?? '';
    controller.selection = TextSelection.collapsed(
      offset: _initialValue?.length ?? 0,
    );

    final error = validate ? state.validator?.call(_initialValue) : null;
    emit(state.copyWith(value: _initialValue, errorText: error));
  }

  void clear() {
    controller.clear();
    emit(state.copyWith(value: null, errorText: null));
  }

  void dispose() {
    controller.removeListener(_handleTextChanged);
    controller.dispose();
  }
}

// class TextFieldCubit extends FieldCubit<String> {
//   final TextEditingController controller = TextEditingController();
//
//   TextFieldCubit({String? initialValue, super.validator})
//     : super(initialValue: initialValue) {
//     controller.text = initialValue ?? '';
//     controller.addListener(_onTextChanged);
//   }
//
//   void _onTextChanged() {
//     // Keep Cubit state updated when user types
//     final text = controller.text;
//     if (text != state.value) {
//       super.onChanged(text);
//     }
//   }
//
//   @override
//   void onChanged(String? value) {
//     // Update Cubit + TextController together
//     if (value != state.value) {
//       controller.text = value ?? '';
//       controller.selection = TextSelection.collapsed(
//         offset: controller.text.length,
//       );
//     }
//     super.onChanged(value);
//   }
//
//   void dispose() {
//     controller.removeListener(_onTextChanged);
//     controller.dispose();
//   }
// }

// class TextFieldCubit extends Cubit<TextFieldState> {
//   final IValidator<String> validator;
//
//   TextFieldCubit({IValidator<String>? validator})
//     : validator = validator ?? RequiredFieldValidator(),
//       super(const TextFieldState());
//
//   void onChanged(String? txt) {
//     debugPrint('TextFieldCubit | onChanged | txt: $txt');
//     final error = validator.validate(txt);
//     emit(state.copyWith(txt: txt, txtFieldError: error));
//   }
//
//   void clear() => emit(state.clear());
//
//   String? validate(String? txt) {
//     final error = validator.validate(txt ?? '');
//     emit(state.copyWith(txtFieldError: error));
//     return error;
//   }
// }
