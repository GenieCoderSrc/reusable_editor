import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/i_validator.dart';

part 'image_field_state.dart';

class ImageCrudCubit extends Cubit<ImageCrudState> {
  ImageCrudCubit() : super(const ImageCrudState());

  // final ImageFormManager imageFormManager;

  void selectImage(File? pickedFile) {
    debugPrint(
        'ImageFieldCubit | selectImage | Image path: ${pickedFile?.path}');

    if (state.isValidImage) {
      emit(ImageCrudState(pickedFile: pickedFile));
    } else {
      emit(ImageCrudState(imgFieldError: state.imgFieldError));
    }

    // String? errorTxt = img?.validateImage();
    //
    // if (errorTxt == null) {
    //   emit(ImageCrudState(img: img));
    // } else {
    //   emit(ImageCrudState(errorTxt: errorTxt));
    // }
  }

// String? validate(File? img) {
//   final String? error = img?.validateImage();
//   emit(state.copyWith(errorTxt: error));
//   return error;
// }

//
// void uploadImage({String? id}) async {
//   FileUploaderEntity? fileEntity = getFileEntity(id: id);
//   if (fileEntity != null) {
//     // upload image
//     FileResponseEntity? fileResponseEntity =
//         await imageFormManager.uploadImage(fileEntity: fileEntity);
//
//     // get result
//     String? imgUrl = fileResponseEntity?.imgUrl;
//     String? id = fileResponseEntity?.id;
//
//     // set state value
//     emit(state.copyWith(imgUrl: imgUrl, id: id));
//   }
// }
//
// deleteImage({required String imgUrl, String? successMsg}) async {
//   await imageFormManager.deleteImage(imgUrl: imgUrl, successMsg: successMsg);
// }
//
// FileUploaderEntity? getFileEntity({String? id}) {
//   final File? img = state.img;
//   return state.isValidImageExists && img != null
//       ? FileUploaderEntity(file: img, id: id)
//       : null;
// }
}
