import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class SaveFavoriteMovieUsecase extends UseCase<void, Movie> {
  final MoviesRepository moviesRepository;
  const SaveFavoriteMovieUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, void>> call(Movie parameter) async {
    return await moviesRepository.saveFavoriteMovie(parameter);
  }
}
