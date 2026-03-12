import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/reusable_editor.dart';

part 'multi_enum_option_state.dart';

class MultiEnumOptionCubit<T extends Enum>
    extends Cubit<MultiEnumOptionState<T>> {
  MultiEnumOptionCubit({required List<EnumOptionEntity<T>> options})
    : super(MultiEnumOptionState(options: options, selectedOptions: const []));

  /// ---------- Read helpers ----------

  bool isSelected(T type) {
    return state.selectedOptions.any((e) => e.type == type);
  }

  List<T> get selectedTypes =>
      state.selectedOptions.map((e) => e.type).toList();

  /// ---------- Select ----------

  void selectOption(EnumOptionEntity<T> option) {
    if (isSelected(option.type)) return;

    final updated = [...state.selectedOptions, option];

    emit(state.copyWith(selectedOptions: updated));
  }

  void selectOptionByType(T type) {
    final option = state.options.firstWhere((element) => element.type == type);

    selectOption(option);
  }

  /// ---------- Unselect ----------

  void unSelectOption(EnumOptionEntity<T> option) {
    final updated = state.selectedOptions
        .where((element) => element.type != option.type)
        .toList();

    emit(state.copyWith(selectedOptions: updated));
  }

  void unSelectOptionByType(T type) {
    final updated = state.selectedOptions
        .where((element) => element.type != type)
        .toList();

    emit(state.copyWith(selectedOptions: updated));
  }

  /// ---------- Toggle ----------

  void toggleOptionByType(T type) {
    if (isSelected(type)) {
      unSelectOptionByType(type);
    } else {
      selectOptionByType(type);
    }
  }

  /// ---------- Bulk ----------

  void selectAll() {
    emit(state.copyWith(selectedOptions: [...state.options]));
  }

  void unSelectAllOptions() {
    emit(state.copyWith(selectedOptions: const []));
  }

  /// ---------- Set values ----------

  void setSelectedTypes(List<T> types) {
    final selected = state.options
        .where((option) => types.contains(option.type))
        .toList();

    emit(state.copyWith(selectedOptions: selected));
  }
}
