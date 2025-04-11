// import 'package:dartz/dartz.dart';
// import 'package:reusable_editor/domain/entities/file_response_entity.dart';
// import 'package:reusable_editor/domain/entities/file_entity.dart';
// import 'package:reusable_editor/domain/usecases/i_usecases/i_delete_file.dart';
// import 'package:reusable_editor/domain/usecases/i_usecases/i_upload_file.dart';
// import 'package:exception_type/exception_type.dart';
// import 'package:i_tdd/i_tdd.dart';
//
// class ImageFormManager {
//   final IUploadFile iUploadFile;
//   final IDeleteFile iDeleteFile;
//
//   ImageFormManager({required this.iUploadFile, required this.iDeleteFile});
//
//   // save image to fire storage or rest api server
//   Future<FileResponseEntity?> uploadImage(
//       {required FileUploaderEntity fileEntity}) async {
//     final Either<IFailure, FileResponseEntity> eitherResponse =
//         await iUploadFile(fileEntity);
//
//     //  Check Report
//     return eitherResponse.handleReport(
//         onSuccess: (FileResponseEntity fileResponseEntity) =>
//             fileResponseEntity);
//   }
//
//   deleteImage({required String imgUrl, String? successMsg}) async {
//     final Either<IFailure, bool> eitherResponse = await iDeleteFile(imgUrl);
//
//     //  Check Report
//     eitherResponse.handleReport(successMsg: successMsg);
//   }
// }
