import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/repositories/language_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetPreferredLanguageUsecase extends UseCase<String, NoParameters> {
  final LanguangeRepository languangeRepository;
  GetPreferredLanguageUsecase(this.languangeRepository);

  @override
  Future<Either<AppError, String>> call(NoParameters parameter) async {
    return await languangeRepository.getPreferredLanguage();
  }
}
