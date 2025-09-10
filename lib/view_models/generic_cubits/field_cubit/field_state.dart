part of 'field_cubit.dart';

class FieldState<T> extends Equatable {
  final T? value;
  final String? errorText;
  final FieldValidator<T>? validator;
  final bool isDirty;

  const FieldState({
    this.value,
    this.errorText,
    this.validator,
    this.isDirty = false,
  });

  bool get isValid => errorText == null;

  FieldState<T> copyWith({
    T? value,
    String? errorText,
    FieldValidator<T>? validator,
    bool? isDirty,
  }) {
    return FieldState<T>(
      value: value ?? this.value,
      errorText: errorText,
      validator: validator ?? this.validator,
      isDirty: isDirty ?? this.isDirty,
    );
  }

  FieldState<T> init() => FieldState<T>(
    value: null,
    validator: validator,
    errorText: null,
    isDirty: false,
  );

  @override
  List<Object?> get props => [value, errorText, validator, isDirty];
}
