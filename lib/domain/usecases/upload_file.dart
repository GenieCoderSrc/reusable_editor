import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:i_tdd/i_tdd.dart';

import '../entities/file_entity.dart';
import '../repositories/i_repositories/i_file_repository.dart';

class UploadFile extends IEitherUseCase<String, FileEntity> {
  final IFileRepository _iFileRepository;

  UploadFile(this._iFileRepository);

  @override
  Future<Either<IFailure, String>> call(FileEntity params) async =>
      _iFileRepository.uploadFile(params);
}

// class UploadFileFireStoreDataSourceImpl implements IUploadFile {
//   final IFileRepository _iFileRepository;
//
//   UploadFileFireStoreDataSourceImpl(this._iFileRepository);
//
//   @override
//   Future<Either<IFailure, String>> call(FileEntity params) async =>
//       _iFileRepository.uploadFile(params);
// }
