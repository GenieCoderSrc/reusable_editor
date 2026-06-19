part of 'uploadable_field_cubit.dart';

abstract class UploadableFieldState extends Equatable {
  final String? error;
  final bool isUploading;
  final bool isDeleting;
  final double uploadProgress;
  final bool isDirty;

  const UploadableFieldState({
    this.error,
    this.isUploading = false,
    this.isDeleting = false,
    this.uploadProgress = 0,
    this.isDirty = false,
  });

  bool get isUploadComplete => uploadProgress >= 1.0;

  @override
  List<Object?> get props => [
    error,
    isUploading,
    isDeleting,
    uploadProgress,
    isDirty,
  ];
}
