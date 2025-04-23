part of 'switch_cubit.dart';

abstract class SwitchState extends Equatable {
  const SwitchState();
}

class SwitchInitial extends SwitchState {
  final bool isOn;

  const SwitchInitial({required this.isOn});

  @override
  List<Object> get props => [isOn];
}
