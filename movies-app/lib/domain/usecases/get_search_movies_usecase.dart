import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetSearchMoviesUsecase
    extends UseCase<List<Movie>, SearchMoviesParameters> {
  final MoviesRepository moviesRepository;
  GetSearchMoviesUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, List<Movie>>> call(
      SearchMoviesParameters parameter) async {
    return await moviesRepository.getSearchMovies(parameter);
  }
}
