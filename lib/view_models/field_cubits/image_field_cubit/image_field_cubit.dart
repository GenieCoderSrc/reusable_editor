import 'dart:io';

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
      'ImageFieldCubit | selectImage | path: ${pickedFile?.path} | error: $error',
    );
  }

  void startUpload() {
    emit(state.copyWith(isUploading: true, uploadProgress: 0.0));
  }

  void updateUploadProgress(double progress) {
    emit(state.copyWith(uploadProgress: progress.clamp(0.0, 1.0)));
  }

  void finishUpload({required String imgUrl}) {
    emit(
      state.copyWith(isUploading: false, uploadProgress: 1.0, imgUrl: imgUrl),
    );
  }

  void startDelete() {
    emit(state.copyWith(isDeleting: true));
  }

  void finishDelete() {
    emit(state.copyWith(isDeleting: false, imgUrl: null, pickedFile: null));
  }

  void clear() => emit(state.clear());
}
