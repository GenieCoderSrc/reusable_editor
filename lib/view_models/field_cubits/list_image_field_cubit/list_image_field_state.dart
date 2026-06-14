part of 'list_image_field_cubit.dart';

class ListImageFieldState extends Equatable {
  final List<XFile>? pickedFiles;
  final List<String>? imgUrls;
  final String? imgFieldError;
  final bool isUploading;
  final bool isDeleting;
  final double uploadProgress; // 0.0 to 1.0 (overall progress)
  final bool isDirty;
  final ImageFieldValidator? validator;

  const ListImageFieldState({
    this.pickedFiles,
    this.imgUrls,
    this.imgFieldError,
    this.isUploading = false,
    this.uploadProgress = 0.0,
    this.isDeleting = false,
    this.isDirty = false,
    this.validator,
  });

  factory ListImageFieldState.initial({ImageFieldValidator? validator}) {
    return ListImageFieldState(validator: validator);
  }

  bool get isValidImages => imgFieldError == null;

  bool get isUploadComplete => uploadProgress >= 1.0;

  bool get hasLocalImages => pickedFiles != null && pickedFiles!.isNotEmpty;

  bool get hasUploadedImages => imgUrls != null && imgUrls!.isNotEmpty;

  ListImageFieldState copyWith({
    List<XFile>? pickedFiles,
    List<String>? imgUrls,
    String? imgFieldError,
    bool? isUploading,
    double? uploadProgress,
    bool? isDeleting,
    bool? isDirty,
    ImageFieldValidator? validator,
  }) {
    return ListImageFieldState(
      pickedFiles: pickedFiles ?? this.pickedFiles,
      imgUrls: imgUrls ?? this.imgUrls,
      imgFieldError: imgFieldError,
      isUploading: isUploading ?? this.isUploading,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      isDeleting: isDeleting ?? this.isDeleting,
      isDirty: isDirty ?? this.isDirty,
      validator: validator ?? this.validator,
    );
  }

  ListImageFieldState clear() =>
      ListImageFieldState.initial(validator: validator);

  @override
  List<Object?> get props => [
    pickedFiles,
    imgUrls,
    imgFieldError,
    isUploading,
    uploadProgress,
    isDeleting,
    isDirty,
    validator,
  ];
}
