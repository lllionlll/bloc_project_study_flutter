import 'package:dartz/dartz.dart';

import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';
import '../entities/app_error.dart';

class GetPopularMoviesUsecase extends UseCase<List<Movie>, NoParameters> {
  final MoviesRepository moviesRepository;
  GetPopularMoviesUsecase(this.moviesRepository);

  @override
  Future<Either<AppError, List<Movie>>> call(NoParameters parameter) async {
    return await moviesRepository.getPopularMovies();
  }
}
