part of 'image_field_cubit.dart';

class ImageFieldState extends Equatable {
  final String? id;
  final XFile? pickedFile;
  final String? imgUrl;
  final String? imgFieldError;
  final bool isUploading;
  final bool isDeleting;
  final double uploadProgress; // 0.0 to 1.0

  const ImageFieldState({
    this.id,
    this.pickedFile,
    this.imgUrl,
    this.imgFieldError,
    this.isUploading = false,
    this.isDeleting = false,
    this.uploadProgress = 0.0,
  });

  bool get isValidImage => imgFieldError == null;

  bool get isUploadComplete => uploadProgress >= 1.0;

  bool get hasLocalImage => pickedFile != null;

  bool get hasUploadedImage => imgUrl?.isNotEmpty == true;

  File? get imageFile => pickedFile != null ? File(pickedFile!.path) : null;

  ImageFieldState copyWith({
    String? id,
    XFile? pickedFile,
    String? imgUrl,
    String? imgFieldError,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
  }) {
    return ImageFieldState(
      id: id ?? this.id,
      pickedFile: pickedFile ?? this.pickedFile,
      imgUrl: imgUrl ?? this.imgUrl,
      imgFieldError: imgFieldError,
      isUploading: isUploading ?? this.isUploading,
      isDeleting: isDeleting ?? this.isDeleting,
      uploadProgress: uploadProgress ?? this.uploadProgress,
    );
  }

  ImageFieldState clear() => const ImageFieldState();

  @override
  List<Object?> get props => [
    id,
    pickedFile,
    imgUrl,
    imgFieldError,
    isUploading,
    isDeleting,
    uploadProgress,
  ];
}
