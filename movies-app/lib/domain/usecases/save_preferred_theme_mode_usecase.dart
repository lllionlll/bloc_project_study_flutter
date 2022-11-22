import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/theme_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class SavePreferredThemeModeUsecase extends UseCase<void, ThemeMode> {
  ThemeRepository themeRepository;
  SavePreferredThemeModeUsecase(this.themeRepository);
  @override
  Future<Either<AppError, void>> call(ThemeMode parameter) async {
    return themeRepository.savePreferredThemeMode(parameter);
  }
}
