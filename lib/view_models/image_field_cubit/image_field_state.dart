part of 'image_field_cubit.dart';

class ImageFieldState extends Equatable {
  final String? id;
  final XFile? pickedFile;
  final String? imgUrl;
  final String? imgFieldError;

  const ImageFieldState({
    this.id,
    this.pickedFile,
    this.imgUrl,
    this.imgFieldError,
  });

  bool get isValidImage => imgFieldError == null;

  ImageFieldState copyWith({
    String? id,
    XFile? pickedFile,
    String? imgUrl,
    String? imgFieldError,
  }) {
    return ImageFieldState(
      id: id ?? this.id,
      pickedFile: pickedFile ?? this.pickedFile,
      imgUrl: imgUrl ?? this.imgUrl,
      imgFieldError: imgFieldError,
    );
  }

  ImageFieldState clear() => const ImageFieldState();

  @override
  List<Object?> get props => [id, pickedFile, imgUrl, imgFieldError];
}
