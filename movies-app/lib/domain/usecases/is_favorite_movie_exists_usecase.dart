import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class IsFavoriteMovieExistsUsecase extends UseCase<bool, int> {
  final MoviesRepository moviesRepository;
  const IsFavoriteMovieExistsUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, bool>> call(int parameter) async {
    return await moviesRepository.isFavoriteMovieExists(parameter);
  }
}
