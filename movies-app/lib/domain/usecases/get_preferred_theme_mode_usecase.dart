import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/repositories/theme_repository.dart';

class GetPreferredThemeModeUsecase {
  ThemeRepository themeRepository;
  GetPreferredThemeModeUsecase(this.themeRepository);

  Either<AppError, ThemeMode> call(NoParameters parameter) {
    return themeRepository.getPrefferedThemeMode();
  }
}
