import 'package:bloc/bloc.dart';
import 'package:reusable_editor/domain/entities/enum_option_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'enum_option_state.dart';

class EnumOptionCubit<T extends Enum> extends Cubit<EnumOptionState<T>> {
  EnumOptionCubit() : super(EnumOptionState());

  // Method to select an option
  void selectOption(EnumOptionEntity<T>? selectedOption) {
    debugPrint(
        'SelectionCubit | selectOption | type: ${selectedOption?.type?.toString()}');
    if (selectedOption != null) {
      emit(EnumOptionState(selectedOption: selectedOption));
    }
  }

  unSelectOption() => emit(EnumOptionState());
}
