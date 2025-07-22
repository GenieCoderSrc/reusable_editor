import 'package:cross_file/cross_file.dart';
import 'package:i_validator/i_validator.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

class ImageFieldCubit extends FieldCubit<XFile> {
  ImageFieldCubit()
    : super(validator: (file) => file?.path.validateImagePath());
}

//
// part 'image_field_state.dart';
//
// class ImageFieldCubit extends Cubit<ImageFieldState> {
//   ImageFieldCubit() : super(const ImageFieldState());
//
//   void selectImage(XFile? pickedFile) {
//     final String? error = pickedFile?.path.validateImagePath();
//
//     if (error == null) {
//       emit(state.copyWith(pickedFile: pickedFile, imgFieldError: null));
//     } else {
//       emit(state.copyWith(imgFieldError: error));
//     }
//
//     debugPrint(
//       'ImageCrudCubit | selectImage | path: ${pickedFile?.path} | error: $error',
//     );
//   }
//
//   void clear() => emit(state.clear());
// }
//
// // final ImageFormManager imageFormManager;
//
// //
// // void uploadImage({String? id}) async {
// //   FileUploaderEntity? fileEntity = getFileEntity(id: id);
// //   if (fileEntity != null) {
// //     // upload image
// //     FileResponseEntity? fileResponseEntity =
// //         await imageFormManager.uploadImage(fileEntity: fileEntity);
// //
// //     // get result
// //     String? imgUrl = fileResponseEntity?.imgUrl;
// //     String? id = fileResponseEntity?.id;
// //
// //     // set state value
// //     emit(state.copyWith(imgUrl: imgUrl, id: id));
// //   }
// // }
// //
// // deleteImage({required String imgUrl, String? successMsg}) async {
// //   await imageFormManager.deleteImage(imgUrl: imgUrl, successMsg: successMsg);
// // }
// //
// // FileUploaderEntity? getFileEntity({String? id}) {
// //   final File? img = state.img;
// //   return state.isValidImageExists && img != null
// //       ? FileUploaderEntity(file: img, id: id)
// //       : null;
// // }
