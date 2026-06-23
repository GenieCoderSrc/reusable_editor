part of 'video_field_cubit.dart';

class VideoFieldState extends UploadableFieldState {
  final XFile? pickedFile;
  final String? videoUrl;

  const VideoFieldState({
    this.pickedFile,
    this.videoUrl,
    super.error,
    super.isUploading,
    super.isDeleting,
    super.uploadProgress,
    super.isDirty,
  });

  bool get hasLocalVideo => pickedFile?.path.isNotEmpty == true;

  bool get hasUploadedVideo => videoUrl?.isNotEmpty == true;

  File? get videoFile => pickedFile == null ? null : File(pickedFile!.path);

  VideoFieldState copyWith({
    Object? pickedFile = _sentinel,
    Object? videoUrl = _sentinel,
    Object? error = _sentinel,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
    bool? isDirty,
  }) {
    return VideoFieldState(
      pickedFile: identical(pickedFile, _sentinel)
          ? this.pickedFile
          : pickedFile as XFile?,
      videoUrl: identical(videoUrl, _sentinel)
          ? this.videoUrl
          : videoUrl as String?,
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
    videoUrl,
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
