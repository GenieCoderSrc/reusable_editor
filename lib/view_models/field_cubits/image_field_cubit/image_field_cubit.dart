import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cross_file/cross_file.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:i_validator/i_validator.dart';
import 'package:reusable_editor/type_def/type_def.dart';

part 'image_field_state.dart';

class ImageFieldCubit extends Cubit<ImageFieldState> {
  final ImageFieldValidator? validator;

  ImageFieldCubit({this.validator})
    : super(
        ImageFieldState.initial(
          validator: validator ?? ((file) => file?.validateImageFile()),
        ),
      );

  void selectImage(XFile? pickedFile) {
    final error = state.validator?.call(pickedFile);
    emit(
      state.copyWith(
        pickedFile: pickedFile,
        imgFieldError: error,
        isDirty: true,
      ),
    );

    debugPrint(
      'ImageFieldCubit | selectImage | path: ${pickedFile?.path} | error: $error | pickedFile: ${pickedFile?.name}',
    );
  }

  void startUpload() =>
      emit(state.copyWith(isUploading: true, uploadProgress: 0.0));

  void updateUploadProgress(double progress) =>
      emit(state.copyWith(uploadProgress: progress.clamp(0.0, 1.0)));

  void finishUpload({required String imgUrl}) => setUploadedUrl(imgUrl: imgUrl);

  void setUploadedUrl({required String imgUrl}) {
    emit(
      state.copyWith(
        isUploading: false,
        uploadProgress: 1.0,
        imgUrl: imgUrl,
        isDirty: true,
        imgFieldError: null,
      ),
    );
  }

  void failUpload({String? error}) {
    emit(
      state.copyWith(
        isUploading: false,
        uploadProgress: 0.0,
        imgFieldError: error ?? 'Failed to upload image',
        isDirty: true,
      ),
    );
  }

  void startDelete() => emit(state.copyWith(isDeleting: true));

  void finishDelete() {
    emit(
      state.copyWith(
        isDeleting: false,
        imgUrl: null,
        pickedFile: null,
        isDirty: true,
        imgFieldError: null,
      ),
    );
  }

  void failDelete({String? error}) {
    emit(
      state.copyWith(
        isDeleting: false,
        imgFieldError: error ?? 'Failed to delete image',
        isDirty: true,
      ),
    );
  }

  void clear() => emit(state.clear());

  /// ✅ Validation logic (create = force, update = dirty only)
  String? validate({bool force = false}) {
    final shouldValidate = force || state.isDirty;
    if (!shouldValidate) return null;

    final error = state.validator?.call(state.pickedFile);
    emit(state.copyWith(imgFieldError: error, isDirty: true));
    return error;
  }
}
