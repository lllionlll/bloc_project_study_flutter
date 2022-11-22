import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class UseCase<ReturnType, Parameter> {
  const UseCase();
  Future<Either<AppError, ReturnType>> call(Parameter parameter);
}
