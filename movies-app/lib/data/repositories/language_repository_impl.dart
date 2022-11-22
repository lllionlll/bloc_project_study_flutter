import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl extends LanguangeRepository {
  final LanguageLocalDataSource languageLocalDataSource;
  LanguageRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final langCode = await languageLocalDataSource.getPreferredLanguage();
      return Right(langCode);
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> savePreferredLanguage(
      String languageCode) async {
    try {
      return Right(
          await languageLocalDataSource.savePreferredLanguage(languageCode));
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }
}
