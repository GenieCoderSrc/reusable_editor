part of 'image_field_cubit.dart';

class ImageFieldState extends UploadableFieldState {
  final XFile? pickedFile;
  final String? imageUrl;

  const ImageFieldState({
    this.pickedFile,
    this.imageUrl,
    super.error,
    super.isUploading,
    super.isDeleting,
    super.uploadProgress,
    super.isDirty,
  });

  bool get hasLocalImage => pickedFile?.path.isNotEmpty == true;

  bool get hasUploadedImage => imageUrl?.isNotEmpty == true;

  File? get imageFile => pickedFile == null ? null : File(pickedFile!.path);

  ImageFieldState copyWith({
    Object? pickedFile = _sentinel,
    Object? imageUrl = _sentinel,
    Object? error = _sentinel,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
    bool? isDirty,
  }) {
    return ImageFieldState(
      pickedFile: identical(pickedFile, _sentinel)
          ? this.pickedFile
          : pickedFile as XFile?,
      imageUrl: identical(imageUrl, _sentinel)
          ? this.imageUrl
          : imageUrl as String?,
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
    pickedFile,
    imageUrl,
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
