import 'package:bloc/bloc.dart';
import 'package:cross_file/cross_file.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:reusable_editor/type_def/type_def.dart';

part 'list_image_field_state.dart';

class ListImageFieldCubit extends Cubit<ListImageFieldState> {
  final ImageFieldValidator? validator;

  ListImageFieldCubit({this.validator})
    : super(ListImageFieldState.initial(validator: validator));

  void selectImages(List<XFile>? pickedFiles) {
    final error = _validateFiles(pickedFiles);
    emit(
      state.copyWith(
        pickedFiles: pickedFiles,
        imgFieldError: error,
        isDirty: true,
      ),
    );

    debugPrint(
      'ListImageFieldCubit | selectImages | count: ${pickedFiles?.length ?? 0} | error: $error',
    );
  }

  String? _validateFiles(List<XFile>? files) {
    if (files == null || files.isEmpty)
      return 'Please select at least one image';

    if (validator != null) {
      for (var file in files) {
        final error = validator!(file);
        if (error != null) return error;
      }
    }
    return null;
  }

  void startUpload() =>
      emit(state.copyWith(isUploading: true, uploadProgress: 0.0));

  void updateUploadProgress(double progress) =>
      emit(state.copyWith(uploadProgress: progress.clamp(0.0, 1.0)));

  void finishUpload({required String imgUrl}) {
    final updatedUrls = List<String>.from(state.imgUrls ?? []);
    updatedUrls.add(imgUrl);

    emit(
      state.copyWith(
        isUploading: false,
        uploadProgress: 1.0,
        imgUrls: updatedUrls,
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
        imgFieldError: error ?? 'Failed to upload images',
        isDirty: true,
      ),
    );
  }

  void startDelete() => emit(state.copyWith(isDeleting: true));

  void finishDelete({required String imgUrl}) {
    final updatedUrls = List<String>.from(state.imgUrls ?? []);
    updatedUrls.remove(imgUrl);

    emit(
      state.copyWith(
        isDeleting: false,
        imgUrls: updatedUrls,
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

  String? validate({bool force = false}) {
    final shouldValidate = force || state.isDirty;
    if (!shouldValidate) return null;

    final error = _validateFiles(state.pickedFiles);
    emit(state.copyWith(imgFieldError: error, isDirty: true));
    return error;
  }
}
