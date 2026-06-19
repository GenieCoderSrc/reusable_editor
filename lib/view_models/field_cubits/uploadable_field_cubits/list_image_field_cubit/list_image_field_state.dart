part of 'list_image_field_cubit.dart';

class ListImageFieldState extends UploadableFieldState {
  final List<XFile> pickedFiles;
  final List<String> imageUrls;

  const ListImageFieldState({
    this.pickedFiles = const [],
    this.imageUrls = const [],
    super.error,
    super.isUploading,
    super.isDeleting,
    super.uploadProgress,
    super.isDirty,
  });

  bool get hasLocalImages => pickedFiles.isNotEmpty;

  bool get hasUploadedImages => imageUrls.isNotEmpty;

  ListImageFieldState copyWith({
    Object? pickedFiles = _sentinel,
    Object? imageUrls = _sentinel,
    Object? error = _sentinel,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
    bool? isDirty,
  }) {
    return ListImageFieldState(
      pickedFiles: identical(pickedFiles, _sentinel)
          ? this.pickedFiles
          : pickedFiles as List<XFile>,
      imageUrls: identical(imageUrls, _sentinel)
          ? this.imageUrls
          : imageUrls as List<String>,
      error: identical(error, _sentinel) ? this.error : error as String?,
      isUploading: isUploading ?? this.isUploading,
      isDeleting: isDeleting ?? this.isDeleting,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      isDirty: isDirty ?? this.isDirty,
    );
  }

  static const _sentinel = Object();

  @override
  List<Object?> get props => [
    pickedFiles,
    imageUrls,
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
