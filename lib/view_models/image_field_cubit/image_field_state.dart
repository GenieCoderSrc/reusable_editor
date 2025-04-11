part of 'image_field_cubit.dart';

class ImageCrudState extends Equatable {
  final String? id;
  final File? pickedFile;
  final String? imgUrl;
  final String? imgFieldError;

  bool get isValidImage => error == null;

  String? get error => pickedFile?.validateImage();

  const ImageCrudState(
      {this.id, this.imgUrl, this.pickedFile, this.imgFieldError});

  ImageCrudState copyWith(
      {String? id,
        File? pickedFile,
        String? imgUrl,
        String? imgFieldError}) =>
      ImageCrudState(
          id: id,
          pickedFile: pickedFile ?? this.pickedFile,
          imgUrl: imgUrl,
          imgFieldError: imgFieldError);

  ImageCrudState clear() => const ImageCrudState(
      id: null, pickedFile: null, imgUrl: null, imgFieldError: null);

  @override
  List<Object?> get props => [id, pickedFile, imgUrl, imgFieldError];
}
