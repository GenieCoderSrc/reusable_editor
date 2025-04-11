import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:i_tdd/i_tdd.dart';

abstract class IGenerateId extends IEitherNonFutureUseCase<String, NoParams> {
  @override
  Either<IFailure, String> call(NoParams params);
}
