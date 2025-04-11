part of 'text_field_cubit.dart';

class TextFieldState extends Equatable {
  final String? txt;
  final IValidator? iValidator;
  final String? txtFieldError;

  bool get isValidInput => error == null;

  String? get error => iValidator?.validate(txt ?? '');

  const TextFieldState({
    this.txt,
    this.iValidator,
    this.txtFieldError,
  });

  TextFieldState copyWith({String? txt, String? txtFieldError}) =>
      TextFieldState(
          txt: txt ?? this.txt,
          txtFieldError: txtFieldError ?? this.txtFieldError);

  TextFieldState clear() =>
      const TextFieldState(txt: null, txtFieldError: null);

  @override
  List<Object?> get props => [txt, txtFieldError, iValidator];
}
