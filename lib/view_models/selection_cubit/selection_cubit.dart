import 'package:bloc/bloc.dart';
import 'package:reusable_editor/domain/entities/enum_option_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'selection_state.dart';

class SelectionCubit<T extends Enum> extends Cubit<SelectionState<T>> {
  SelectionCubit() : super(SelectionState());

  // Method to select an option
  void selectOption(EnumOptionEntity<T>? selectedOption) {
    debugPrint(
        'SelectionCubit | selectOption | type: ${selectedOption?.type?.toString()}');
    if (selectedOption != null) {
      emit(SelectionState(selectedOption: selectedOption));
    }
  }

  unSelectOption() => emit(SelectionState());
}
