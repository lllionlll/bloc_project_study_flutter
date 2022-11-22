import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetUpcomingMoviesUsecase extends UseCase<List<Movie>, NoParameters> {
  final MoviesRepository moviesRepository;
  GetUpcomingMoviesUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, List<Movie>>> call(NoParameters parameter) async {
    return await moviesRepository.getUpcomingMovies();
  }
}
