import 'package:equatable/equatable.dart';

abstract class FormSubmissionState extends Equatable {
  const FormSubmissionState();

  @override
  List<Object> get props => <Object>[];
}

class InitialFormState extends FormSubmissionState {
  const InitialFormState();
}

class FormSubmitting extends FormSubmissionState {}

class SubmissionSuccess extends FormSubmissionState {}

class SubmissionFailed extends FormSubmissionState {
  final String message;

  const SubmissionFailed(this.message);

  @override
  List<Object> get props => <Object>[message];
}
