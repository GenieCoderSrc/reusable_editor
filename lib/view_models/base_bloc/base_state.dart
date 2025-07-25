import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => <Object>[];
}

class Initial extends BaseState {}

class DataLoading extends BaseState {}

class SubmittedState extends BaseState {}

class Success extends BaseState {}

class DataLoaded extends BaseState {}

class LoadingFailed extends BaseState {
  final String message;

  const LoadingFailed(this.message);

  @override
  List<Object> get props => <Object>[message];
}

