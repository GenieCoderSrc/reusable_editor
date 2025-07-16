part of 'switch_cubit.dart';


class SwitchState extends Equatable {
  final bool isOn;
  final String? fieldError;

  const SwitchState({
    required this.isOn,
    this.fieldError,
  });

  bool get isValid => fieldError == null;

  SwitchState copyWith({
    bool? isOn,
    String? fieldError,
  }) {
    return SwitchState(
      isOn: isOn ?? this.isOn,
      fieldError: fieldError,
    );
  }

  @override
  List<Object?> get props => [isOn, fieldError];
}
