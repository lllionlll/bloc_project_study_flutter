import 'package:movies_app/data/data_sources/theme_local_data_source.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:flutter/src/material/app.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeLocalDataSource themeLocalDataSource;

  ThemeRepositoryImpl(this.themeLocalDataSource);
  @override
  Either<AppError, ThemeMode> getPrefferedThemeMode() {
    try {
      ThemeMode themeMode = themeLocalDataSource.getPrefferedThemeMode();
      return Right(themeMode);
    } on Exception {
      return const Left(AppError(ErrorType.sharedPrefernces));
    }
  }

  @override
  Future<Either<AppError, void>> savePreferredThemeMode(
      ThemeMode themeMode) async {
    try {
      final response =
          await themeLocalDataSource.savePreferredThemeMode(themeMode);
      return Right(response);
    } on Exception {
      return const Left(AppError(ErrorType.sharedPrefernces));
    }
  }
}
