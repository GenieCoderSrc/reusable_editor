import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/i_validator.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  final IValidator<String> validator;

  TextFieldCubit({IValidator<String>? validator})
    : validator = validator ?? RequiredFieldValidator(),
      super(const TextFieldState());

  void onChanged(String? txt) {
    debugPrint('TextFieldCubit | onChanged | txt: $txt');
    final error = validator.validate(txt);
    emit(state.copyWith(txt: txt, txtFieldError: error));
  }

  void clear() => emit(state.clear());

  String? validate(String? txt) {
    final error = validator.validate(txt ?? '');
    emit(state.copyWith(txtFieldError: error));
    return error;
  }
}
