import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/usecases/use_case.dart';

class GetAllFavoriteMoviesUsecase
    extends UseCase<List<MovieTable>, NoParameters> {
  final MoviesRepository moviesRepository;
  const GetAllFavoriteMoviesUsecase(this.moviesRepository);
  @override
  Future<Either<AppError, List<MovieTable>>> call(
      NoParameters parameter) async {
    return await moviesRepository.getAllFavoriteMovies();
  }
}
