import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class ThemeRepository {
  Future<Either<AppError, void>> savePreferredThemeMode(ThemeMode themeMode);
  Either<AppError, ThemeMode> getPrefferedThemeMode();
}
