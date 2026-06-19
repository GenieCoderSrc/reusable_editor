import 'package:cross_file/cross_file.dart';
import 'package:i_validator/i_validator.dart';
import 'package:reusable_editor/type_def/type_def.dart';
import 'package:reusable_editor/view_models/field_cubits/uploadable_field_cubits/base/uploadable_field_cubit.dart';

part 'list_image_field_state.dart';

class ListImageFieldCubit extends UploadableFieldCubit<ListImageFieldState> {
  final ListImageValidator validator;

  ListImageFieldCubit({ListImageValidator? validator})
    : validator = validator ?? ((files) => files?.validateImageFiles()),
      super(const ListImageFieldState());

  void selectImages(List<XFile> files) {
    emit(
      state.copyWith(
        pickedFiles: files,
        error: validator(files),
        isDirty: true,
      ),
    );
  }

  void startUpload() {
    emit(state.copyWith(isUploading: true));
  }

  void updateUploadProgress(double progress) {
    emit(state.copyWith(uploadProgress: normalizeProgress(progress)));
  }

  void finishUpload(String imageUrl) {
    emit(
      state.copyWith(
        imageUrls: [...state.imageUrls, imageUrl],
        isUploading: false,
        uploadProgress: 1,
        error: null,
      ),
    );
  }

  void startDelete() {
    emit(state.copyWith(isDeleting: true));
  }

  void finishDelete(String imageUrl) {
    emit(
      state.copyWith(
        imageUrls: state.imageUrls.where((e) => e != imageUrl).toList(),
        isDeleting: false,
      ),
    );
  }

  String? validate({bool force = false}) {
    if (!shouldValidate(force: force, isDirty: state.isDirty)) {
      return null;
    }

    final error = validator(state.pickedFiles);

    emit(state.copyWith(error: error));

    return error;
  }

  void clear() {
    emit(const ListImageFieldState());
  }
}
