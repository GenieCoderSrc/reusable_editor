part of 'field_cubit.dart';

class FieldState<T> extends Equatable {
  final T? value;
  final String? errorText;
  final FieldValidator<T>? validator; // ✅ updated type

  const FieldState({this.value, this.errorText, this.validator});

  bool get isValid => errorText == null;

  FieldState<T> copyWith({
    T? value,
    String? errorText,
    FieldValidator<T>? validator,
    bool clearError = false,
  }) {
    return FieldState<T>(
      value: value ?? this.value,
      errorText: clearError ? null : errorText ?? this.errorText,
      validator: validator ?? this.validator,
    );
  }

  FieldState<T> init() => FieldState<T>(
    value: null,
    validator: validator,
    errorText: validator?.call(null),
  );

  @override
  List<Object?> get props => [value, errorText, validator];
}
