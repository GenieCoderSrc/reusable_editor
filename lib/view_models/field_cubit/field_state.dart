part of 'field_cubit.dart';

class FieldState<T> extends Equatable {
  final T? value;
  final String? errorText;
  final IValidator<T>? validator;

  const FieldState({this.value, this.errorText, this.validator});

  bool get isValid => errorText == null;

  FieldState<T> copyWith({
    T? value,
    String? errorText,
    IValidator<T>? validator,
    bool clearError = false,
  }) {
    return FieldState<T>(
      value: value ?? this.value,
      errorText: clearError ? null : errorText ?? this.errorText,
      validator: validator ?? this.validator,
    );
  }

  FieldState<T> init() => FieldState<T>(value: null, validator: validator);

  @override
  List<Object?> get props => [value, errorText, validator];
}
