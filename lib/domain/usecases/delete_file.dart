import 'package:dartz/dartz.dart';

import 'package:exception_type/exception_type.dart';
import 'package:i_tdd/i_tdd.dart';

import '../repositories/i_repositories/i_file_repository.dart';

class DeleteFile extends IEitherUseCase<bool, String> {
  final IFileRepository _iFileRepository;

  DeleteFile(this._iFileRepository);

  @override
  Future<Either<IFailure, bool>> call(String params) async =>
      _iFileRepository.deleteFile(params);
}
