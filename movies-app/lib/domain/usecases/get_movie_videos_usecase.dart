import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/entities/video.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetMovieVideowUsecase
    extends UseCase<List<Video>, MovieDetailsParameters> {
  final MoviesRepository moviesRepository;
  const GetMovieVideowUsecase({required this.moviesRepository});
  @override
  Future<Either<AppError, List<Video>>> call(
      MovieDetailsParameters parameter) async {
    return await moviesRepository.getMovieVideos(parameter.movieId);
  }
}
