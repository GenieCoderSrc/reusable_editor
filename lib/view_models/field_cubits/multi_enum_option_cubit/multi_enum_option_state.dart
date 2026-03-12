import 'package:equatable/equatable.dart';
import 'package:reusable_editor/reusable_editor.dart';

class MultiEnumOptionState<T extends Enum> extends Equatable {
  final List<EnumOptionEntity<T>> options;

  final List<EnumOptionEntity<T>> selectedOptions;

  const MultiEnumOptionState({
    required this.options,
    required this.selectedOptions,
  });

  MultiEnumOptionState<T> copyWith({
    List<EnumOptionEntity<T>>? options,
    List<EnumOptionEntity<T>>? selectedOptions,
  }) {
    return MultiEnumOptionState(
      options: options ?? this.options,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  List<Object?> get props => [
    options,
    selectedOptions,
  ];
}