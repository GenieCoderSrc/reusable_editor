import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/i_validator.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

class ImageFieldCubit extends FieldCubit<XFile> {
  ImageFieldCubit()
    : super(validator: (file) => file?.path.validateImagePath());

  void selectImage(XFile? pickedFile) {
    debugPrint('ImageCrudCubit | selectImage | path: ${pickedFile?.path}');
    super.onChanged(pickedFile);
  }
}
