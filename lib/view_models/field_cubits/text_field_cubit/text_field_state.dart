part of 'text_field_cubit.dart';

class TextFieldState extends Equatable {
  final String? value;
  final String? errorText;
  final TextFieldValidator? validator;
  final bool isDirty;

  const TextFieldState({
    this.value,
    this.errorText,
    this.validator,
    this.isDirty = false,
  });

  factory TextFieldState.initial({
    String? initialValue,
    TextFieldValidator? validator,
  }) {
    return TextFieldState(
      value: initialValue,
      errorText: null, // no error initially
      validator: validator,
      isDirty: false,
    );
  }

  TextFieldState copyWith({
    String? value,
    String? errorText,
    TextFieldValidator? validator,
    bool? isDirty,
  }) {
    return TextFieldState(
      value: value ?? this.value,
      errorText: errorText ?? this.errorText,
      validator: validator ?? this.validator,
      isDirty: isDirty ?? this.isDirty,
    );
  }

  @override
  List<Object?> get props => [value, errorText, validator, isDirty];
}
