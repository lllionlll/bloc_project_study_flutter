import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/repositories/language_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class SavePreferredLanguageUsecase extends UseCase<void, String> {
  final LanguangeRepository languangeRepository;
  SavePreferredLanguageUsecase(this.languangeRepository);

  @override
  Future<Either<AppError, void>> call(String parameter) async {
    return await languangeRepository.savePreferredLanguage(parameter);
  }
}
