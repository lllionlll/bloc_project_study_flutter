import 'package:dartz/dartz.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';
import 'package:movies_app/domain/entities/video.dart';

abstract class MoviesRepository {
/////////////////////////////////////// API ////////////////////////////////////////////////
  Future<Either<AppError, List<Movie>>> getTrendingMovies();
  Future<Either<AppError, List<Movie>>> getPopularMovies();
  Future<Either<AppError, List<Movie>>> getNowPlayingMovies();
  Future<Either<AppError, List<Movie>>> getUpcomingMovies();
  Future<Either<AppError, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<AppError, List<CastMember>>> getMovieCastMembers(int movieId);
  Future<Either<AppError, List<Video>>> getMovieVideos(int movieId);
  Future<Either<AppError, List<Movie>>> getSearchMovies(
      SearchMoviesParameters parameters);
////////////////////////////////////// db//////////////////////////////////////////////////////
  Future<Either<AppError, void>> saveFavoriteMovie(Movie movie);
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
  Future<Either<AppError, bool>> isFavoriteMovieExists(int movieId);
  Future<Either<AppError, List<MovieTable>>> getAllFavoriteMovies();
}
