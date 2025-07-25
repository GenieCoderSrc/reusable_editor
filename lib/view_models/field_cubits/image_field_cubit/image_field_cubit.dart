import 'package:bloc/bloc.dart';
import 'package:cross_file/cross_file.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/i_validator.dart';

part 'image_field_state.dart';

class ImageFieldCubit extends Cubit<ImageFieldState> {
  ImageFieldCubit() : super(const ImageFieldState());

  void selectImage(XFile? pickedFile) {
    final String? error = pickedFile?.path.validateImagePath();

    if (error == null) {
      emit(state.copyWith(pickedFile: pickedFile, imgFieldError: null));
    } else {
      emit(state.copyWith(imgFieldError: error));
    }

    debugPrint(
      'ImageCrudCubit | selectImage | path: ${pickedFile?.path} | error: $error',
    );
  }

  void clear() => emit(state.clear());
}
//
// class ImageFieldCubit extends FieldCubit<XFile> {
//   ImageFieldCubit()
//     : super(validator: (file) => file?.path.validateImagePath());
//
//   void selectImage(XFile? pickedFile) {
//     debugPrint('ImageCrudCubit | selectImage | path: ${pickedFile?.path}');
//     super.onChanged(pickedFile);
//   }
// }
