import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'multi_enum_option_state.dart';

class MultiEnumOptionCubit<T extends Enum>
    extends Cubit<MultiEnumOptionState<T>> {
  MultiEnumOptionCubit() : super(const MultiEnumOptionState());

  /// Replace entire selection
  void setSelected(List<T>? values) {
    emit(
      MultiEnumOptionState(
        selectedTypes: values ?? [],
      ),
    );
  }

  /// Toggle a value
  void toggleOption(T type) {
    final selected = List<T>.from(state.selectedTypes);

    if (selected.contains(type)) {
      selected.remove(type);
    } else {
      selected.add(type);
    }

    emit(MultiEnumOptionState(selectedTypes: selected));
  }

  /// Add a value if not already selected
  void selectOption(T type) {
    final selected = List<T>.from(state.selectedTypes);

    if (!selected.contains(type)) {
      selected.add(type);
      emit(MultiEnumOptionState(selectedTypes: selected));
    }
  }

  /// Remove a selected value
  void unSelectOption(T type) {
    final selected = List<T>.from(state.selectedTypes);

    if (selected.contains(type)) {
      selected.remove(type);
      emit(MultiEnumOptionState(selectedTypes: selected));
    }
  }

  /// Add multiple values
  void addOptions(List<T> types) {
    final selected = List<T>.from(state.selectedTypes);

    for (final type in types) {
      if (!selected.contains(type)) {
        selected.add(type);
      }
    }

    emit(MultiEnumOptionState(selectedTypes: selected));
  }

  /// Remove multiple values
  void removeOptions(List<T> types) {
    final selected = List<T>.from(state.selectedTypes);

    selected.removeWhere((element) => types.contains(element));

    emit(MultiEnumOptionState(selectedTypes: selected));
  }

  /// Clear all selections
  void clearSelection() {
    emit(const MultiEnumOptionState());
  }

  /// Check if a value is selected
  bool isSelected(T type) {
    return state.selectedTypes.contains(type);
  }

  /// Read-only selected values
  List<T> get selectedTypes => List.unmodifiable(state.selectedTypes);
}