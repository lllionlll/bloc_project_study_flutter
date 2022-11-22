import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/movies_local_data_source.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';
import 'package:movies_app/domain/entities/video.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final MoviesLocalDatasource moviesLocalDatasource;
  MoviesRepositoryImpl(this.moviesRemoteDataSource, this.moviesLocalDatasource);

/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Movie>>> getTrendingMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getTrendingMovies();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Movie>>> getPopularMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getPopularMovies();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Movie>>> getUpcomingMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getUpcomingMovies();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, MovieDetails>> getMovieDetails(int movieId) async {
    try {
      final MovieDetails movie =
          await moviesRemoteDataSource.getMovieDetails(movieId);
      return Right(movie);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<CastMember>>> getMovieCastMembers(
      int movieId) async {
    try {
      final castMembers =
          await moviesRemoteDataSource.getMovieCastMembers(movieId);
      return Right(castMembers);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Video>>> getMovieVideos(int movieId) async {
    try {
      final videos = await moviesRemoteDataSource.getMovieVideos(movieId);
      return Right(videos);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, List<Movie>>> getSearchMovies(
      SearchMoviesParameters parameters) async {
    try {
      final movies = await moviesRemoteDataSource.getSearchMovies(parameters);
      return Right(movies);
    } on SocketException {
      return const Left(AppError(ErrorType.network));
    } on Exception {
      //TODO: pass the api message here, then check for message when (state is error)
      return const Left(AppError(ErrorType.api));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId) async {
    try {
      final respose = await moviesLocalDatasource.deleteFavoriteMovie(movieId);
      return Right(respose);
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieTable>>> getAllFavoriteMovies() async {
    try {
      final movies = await moviesLocalDatasource.getAllFavoriteMovies();
      return Right(movies);
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }

  @override
  Future<Either<AppError, bool>> isFavoriteMovieExists(int movieId) async {
    try {
      final respose =
          await moviesLocalDatasource.isFavoriteMovieExists(movieId);
      return Right(respose);
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveFavoriteMovie(Movie movie) async {
    try {
      final response = await moviesLocalDatasource
          .saveFavoriteMovie(MovieTable.fromMovie(movie));
      return Right(response);
    } on Exception {
      return const Left(AppError(ErrorType.database));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

}
