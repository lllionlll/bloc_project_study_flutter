import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetMovieDetailsUsecase
    extends UseCase<MovieDetails, MovieDetailsParameters> {
  final MoviesRepository moviesRepository;
  const GetMovieDetailsUsecase(this.moviesRepository);

  @override
  Future<Either<AppError, MovieDetails>> call(
      MovieDetailsParameters parameter) {
    return moviesRepository.getMovieDetails(parameter.movieId);
  }
}
