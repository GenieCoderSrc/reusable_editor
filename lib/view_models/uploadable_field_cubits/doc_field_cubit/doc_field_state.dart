part of 'doc_field_cubit.dart';

class DocFieldState extends UploadableFieldState {
  final XFile? pickedFile;
  final String? docUrl;

  const DocFieldState({
    this.pickedFile,
    this.docUrl,
    super.error,
    super.isUploading,
    super.isDeleting,
    super.uploadProgress,
    super.isDirty,
  });

  bool get hasLocalDoc => pickedFile?.path.isNotEmpty == true;
  bool get hasUploadedDoc => docUrl?.isNotEmpty == true;
  File? get docFile => pickedFile == null ? null : File(pickedFile!.path);

  DocFieldState copyWith({
    Object? pickedFile = _sentinel,
    Object? docUrl = _sentinel,
    Object? error = _sentinel,
    bool? isUploading,
    bool? isDeleting,
    double? uploadProgress,
    bool? isDirty,
  }) {
    return DocFieldState(
      pickedFile: identical(pickedFile, _sentinel)
          ? this.pickedFile
          : pickedFile as XFile?,
      docUrl: identical(docUrl, _sentinel) ? this.docUrl : docUrl as String?,
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
    docUrl,
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
