part of 'text_field_cubit.dart';

typedef TextFieldValidator = String? Function(String? value);

class TextFieldState extends Equatable {
  final String? value;
  final String? errorText;
  final TextFieldValidator? validator;

  const TextFieldState({this.value, this.errorText, this.validator});

  factory TextFieldState.initial({
    String? initialValue,
    TextFieldValidator? validator,
  }) {
    final error = validator?.call(initialValue);
    return TextFieldState(
      value: initialValue,
      errorText: error,
      validator: validator,
    );
  }

  TextFieldState copyWith({
    String? value,
    String? errorText,
    TextFieldValidator? validator,
  }) {
    return TextFieldState(
      value: value ?? this.value,
      errorText: errorText,
      validator: validator ?? this.validator,
    );
  }

  @override
  List<Object?> get props => [value, errorText, validator];
}

//
// class TextFieldState extends Equatable {
//   final String? txt;
//   final String? txtFieldError;
//
//   const TextFieldState({
//     this.txt,
//     this.txtFieldError,
//   });
//
//   bool get isValid => txtFieldError == null;
//
//   TextFieldState copyWith({
//     String? txt,
//     String? txtFieldError,
//   }) {
//     return TextFieldState(
//       txt: txt ?? this.txt,
//       txtFieldError: txtFieldError,
//     );
//   }
//
//   TextFieldState clear() => const TextFieldState();
//
//   @override
//   List<Object?> get props => [txt, txtFieldError];
// }
//
