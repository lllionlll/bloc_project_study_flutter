import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetMovieCastMembersUsecase
    extends UseCase<List<CastMember>, MovieDetailsParameters> {
  final MoviesRepository moviesRepository;
  const GetMovieCastMembersUsecase({required this.moviesRepository});

  @override
  Future<Either<AppError, List<CastMember>>> call(
      MovieDetailsParameters parameter) async {
    return await moviesRepository.getMovieCastMembers(parameter.movieId);
  }
}
