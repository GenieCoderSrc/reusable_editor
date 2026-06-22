import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:i_validator/i_validator.dart';
import 'package:reusable_editor/type_def/type_def.dart';
import 'package:reusable_editor/view_models/field_cubits/uploadable_field_cubits/base/uploadable_field_cubit.dart';

part 'video_field_state.dart';

class VideoFieldCubit extends UploadableFieldCubit<VideoFieldState> {
  final ImageFieldValidator validator;

  VideoFieldCubit({ImageFieldValidator? validator})
    : validator = validator ?? ((file) => file?.validateVideoFile()),
      super(const VideoFieldState());

  void selectVideo(XFile? file) {
    emit(
      state.copyWith(pickedFile: file, error: validator(file), isDirty: true),
    );
  }

  void startUpload() {
    emit(state.copyWith(isUploading: true, uploadProgress: 0));
  }

  void updateUploadProgress(double progress) {
    emit(state.copyWith(uploadProgress: normalizeProgress(progress)));
  }

  void finishUpload({required String videoUrl}) {
    emit(
      state.copyWith(
        videoUrl: videoUrl,
        error: null,
        isUploading: false,
        uploadProgress: 1,
        isDirty: true,
      ),
    );
  }

  void failUpload({String? error}) {
    emit(state.copyWith(error: error, isUploading: false, uploadProgress: 0));
  }

  void startDelete() {
    emit(state.copyWith(isDeleting: true));
  }

  void finishDelete() {
    emit(
      state.copyWith(
        pickedFile: null,
        videoUrl: null,
        error: null,
        isDeleting: false,
        isDirty: true,
      ),
    );
  }

  void failDelete({String? error}) {
    emit(state.copyWith(error: error, isDeleting: false));
  }

  String? validate({bool force = false}) {
    if (!shouldValidate(force: force, isDirty: state.isDirty)) {
      return null;
    }

    final error = validator(state.pickedFile);

    emit(state.copyWith(error: error));

    return error;
  }

  void clear() {
    emit(const VideoFieldState());
  }
}
