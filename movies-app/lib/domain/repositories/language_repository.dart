import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class LanguangeRepository {
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, void>> savePreferredLanguage(String languageCode);
}
