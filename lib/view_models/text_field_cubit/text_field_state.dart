part of 'text_field_cubit.dart';

class TextFieldState extends Equatable {
  final String? txt;
  final String? txtFieldError;

  const TextFieldState({
    this.txt,
    this.txtFieldError,
  });

  bool get isValid => txtFieldError == null;

  TextFieldState copyWith({
    String? txt,
    String? txtFieldError,
  }) {
    return TextFieldState(
      txt: txt ?? this.txt,
      txtFieldError: txtFieldError,
    );
  }

  TextFieldState clear() => const TextFieldState();

  @override
  List<Object?> get props => [txt, txtFieldError];
}

