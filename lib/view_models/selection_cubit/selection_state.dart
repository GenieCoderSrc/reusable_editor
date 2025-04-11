part of 'selection_cubit.dart';

class SelectionState<T extends Enum> extends Equatable {
  final EnumOptionEntity<T>? selectedOption;

  const SelectionState({this.selectedOption});

  bool get isValidSelection => selectedOption != null;

  @override
  List<Object?> get props => [selectedOption];
}
