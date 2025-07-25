part of 'enum_option_cubit.dart';

class EnumOptionState<T extends Enum> extends Equatable {
  final EnumOptionEntity<T>? selectedOption;

  const EnumOptionState({this.selectedOption});

  bool get isValidSelection => selectedOption != null;

  @override
  List<Object?> get props => [selectedOption];
}
