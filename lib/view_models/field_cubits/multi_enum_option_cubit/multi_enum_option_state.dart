part of 'multi_enum_option_cubit.dart';

class MultiEnumOptionState<T extends Enum> extends Equatable {
  final List<T> selectedTypes;

  const MultiEnumOptionState({
    this.selectedTypes = const [],
  });

  bool get hasSelection => selectedTypes.isNotEmpty;

  bool isSelected(T type) => selectedTypes.contains(type);

  @override
  List<Object?> get props => [selectedTypes];
}