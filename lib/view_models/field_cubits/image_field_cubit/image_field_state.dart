part of 'image_field_cubit.dart';

class ImageFieldState extends Equatable {
  final XFile? pickedFile;
  final String? imgUrl;
  final String? imgFieldError;
  final bool isUploading;
  final bool isDeleting;
  final double uploadProgress; // 0.0 to 1.0
  final bool isDirty;
  final ImageFieldValidator? validator;

  const ImageFieldState({
    this.pickedFile,
    this.imgUrl,
    this.imgFieldError,
    this.isUploading = false,
    this.uploadProgress = 0.0,
    this.isDeleting = false,
    this.isDirty = false,
    this.validator,
  });

  factory ImageFieldState.initial({ImageFieldValidator? validator}) {
    return ImageFieldState(
      validator: validator ?? ((file) => file?.validateImageFile()),
    );
  }

  bool get isValidImage => imgFieldError == null;

  bool get isUploadComplete => uploadProgress >= 1.0;

  bool get hasLocalImage => pickedFile != null;

  bool get hasUploadedImage => imgUrl?.isNotEmpty == true;

  File? get imageFile => pickedFile != null ? File(pickedFile!.path) : null;

  ImageFieldState copyWith({
    XFile? pickedFile,
    String? imgUrl,
    String? imgFieldError,
    bool? isUploading,
    double? uploadProgress,
    bool? isDeleting,
    bool? isDirty,
    ImageFieldValidator? validator,
  }) {
    return ImageFieldState(
      pickedFile: pickedFile ?? this.pickedFile,
      imgUrl: imgUrl ?? this.imgUrl,
      imgFieldError: imgFieldError,
      isUploading: isUploading ?? this.isUploading,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      isDeleting: isDeleting ?? this.isDeleting,
      isDirty: isDirty ?? this.isDirty,
      validator: validator ?? this.validator,
    );
  }

  ImageFieldState clear() => ImageFieldState.initial(validator: validator);

  @override
  List<Object?> get props => [
    pickedFile,
    imgUrl,
    imgFieldError,
    isUploading,
    uploadProgress,
    isDeleting,
    isDirty,
    validator,
  ];
}
