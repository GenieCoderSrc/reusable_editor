part of 'audio_field_cubit.dart';

class AudioFieldState extends UploadableFieldState {
  final XFile? pickedFile;
  final String? audioUrl;

  const AudioFieldState({
    this.pickedFile,
    this.audioUrl,
    super.error,
    super.isUploading,
    super.isDeleting,
    super.uploadProgress,
    super.isDirty,
  });

  bool get hasLocalAudio => pickedFile?.path.isNotEmpty == true;

  bool get hasUploadedAudio => audioUrl?.isNotEmpty == true;

  File? get audioFile => pickedFile == null ? null : File(pickedFile!.path);

  AudioFieldState copyWith({
    Object? pickedFile = _sentinel,
    Object? audioUrl = _sentinel,
    Object? error = _sentinel,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
    bool? isDirty,
  }) {
    return AudioFieldState(
      pickedFile: identical(pickedFile, _sentinel)
          ? this.pickedFile
          : pickedFile as XFile?,
      audioUrl: identical(audioUrl, _sentinel)
          ? this.audioUrl
          : audioUrl as String?,
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
    audioUrl,
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
