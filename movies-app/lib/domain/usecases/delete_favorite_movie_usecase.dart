import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class DeleteFavoriteMovieUsecase extends UseCase<void, int> {
  final MoviesRepository moviesRepository;
  const DeleteFavoriteMovieUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, void>> call(int parameter) async {
    return await moviesRepository.deleteFavoriteMovie(parameter);
  }
}
