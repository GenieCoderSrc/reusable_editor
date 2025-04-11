import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/utils/i_validator.dart';
import 'package:i_validator/utils/required_field_validator.dart';


part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit({IValidator? validator})
      : super(
      TextFieldState(iValidator: validator ?? RequiredFieldValidator()));

  void onChanged(String txt) {
    debugPrint('TextFieldCubit | onChanged | txt: $txt');
    validate(txt);
    if (state.isValidInput) {
      emit(state.copyWith(txt: txt));
    }
  }

  String? validate(String? txt) {
    final String? error = state.iValidator?.validate(txt ?? '');
    emit(state.copyWith(txtFieldError: error));
    return error;
  }
}
