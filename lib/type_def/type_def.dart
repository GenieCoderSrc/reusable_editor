import 'package:cross_file/cross_file.dart';

typedef FieldValidator<T> = String? Function(T? value);

typedef TextFieldValidator = String? Function(String? value);

typedef ImageFieldValidator = String? Function(XFile? file);
