import 'package:cross_file/cross_file.dart';
import 'package:i_validator/i_validator.dart';

extension XFileImageValidationExtension on XFile {
  /// Validates if the XFile represents a valid image file.
  /// Uses [name] on Web (since path is a blob), otherwise [path].
  String? validateImageFile() {
    final source = path.toLowerCase().startsWith('blob:') ? name : path;
    return source.validateImagePath();
  }
}
