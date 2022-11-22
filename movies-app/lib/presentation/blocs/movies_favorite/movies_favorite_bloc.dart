import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

import '../../../domain/usecases/delete_favorite_movie_usecase.dart';
import '../../../domain/usecases/get_all_favorite_movies_usecase.dart';
import '../../../domain/usecases/is_favorite_movie_exists_usecase.dart';
import '../../../domain/usecases/save_favorite_movie_usecase.dart';

part 'movies_favorite_event.dart';
part 'movies_favorite_state.dart';

class MoviesFavoriteBloc
    extends Bloc<MoviesFavoriteEvent, MoviesFavoriteState> {
  SaveFavoriteMovieUsecase saveFavoriteMovieUsecase;
  DeleteFavoriteMovieUsecase deleteFavoriteMovieUsecase;
  IsFavoriteMovieExistsUsecase isFavoriteMovieExistsUsecase;
  GetAllFavoriteMoviesUsecase getAllFavoriteMoviesUsecase;
  LoadingBloc loadingBloc;
  MoviesFavoriteBloc({
    required this.saveFavoriteMovieUsecase,
    required this.deleteFavoriteMovieUsecase,
    required this.isFavoriteMovieExistsUsecase,
    required this.getAllFavoriteMoviesUsecase,
    required this.loadingBloc,
  }) : super(MoviesFavoriteInitialState()) {
    on<MoviesFavoriteCheckIfFavoriteEvent>(
        _onMoviesFavoriteCheckIfFavoriteEvent);
    on<MoviesFavoriteToggleFavoriteEvent>(_onMoviesFavoriteToggleFavoriteEvent);

    on<MoviesFavoriteGetAllFavoritesEvent>(
        _onMoviesFavoriteGetAllFavoritesEvent);
    on<MoviesFavoriteDeleteMovieEvent>(_onMoviesFavoriteDeleteMovieEvent);
  }

////////////////////////////////////////////////////////////////////////////////////////

  Future<void> _onMoviesFavoriteCheckIfFavoriteEvent(
    MoviesFavoriteCheckIfFavoriteEvent event,
    Emitter<MoviesFavoriteState> emite,
  ) async {
    final response = await isFavoriteMovieExistsUsecase.call(event.movieId);
    response.fold((appError) {
      emite(MoviesFavoriteErrorState(errorType: appError.errorType));
    }, (isFavorite) {
      emite(MoviesFavoriteIsFavoriteOrNotState(
          isFavorite: isFavorite, movieId: event.movieId));
    });
  }
////////////////////////////////////////////////////////////////////////////////////////

  //TODO: refactor this code
  Future<void> _onMoviesFavoriteToggleFavoriteEvent(
    MoviesFavoriteToggleFavoriteEvent event,
    Emitter<MoviesFavoriteState> emite,
  ) async {
    final movieTable = event.movieTable;
    if (event.isFavorite) {
      await deleteFavoriteMovieUsecase.call(movieTable.id!);
    } else {
      await saveFavoriteMovieUsecase.call(movieTable);
    }
    final response = await isFavoriteMovieExistsUsecase.call(movieTable.id!);
    response.fold((appError) {
      emite(MoviesFavoriteErrorState(errorType: appError.errorType));
    }, (isExisting) {
      emite(MoviesFavoriteIsFavoriteOrNotState(
          isFavorite: isExisting, movieId: movieTable.id!));
    });
  }
////////////////////////////////////////////////////////////////////////////////////////

  Future<void> _onMoviesFavoriteGetAllFavoritesEvent(
    MoviesFavoriteGetAllFavoritesEvent event,
    Emitter<MoviesFavoriteState> emite,
  ) async {
    loadingBloc.add(StartLoadingEvent());

    final resposne = await getAllFavoriteMoviesUsecase.call(NoParameters());
    resposne.fold((appError) {
      emite(MoviesFavoriteErrorState(errorType: appError.errorType));
    }, (favoriteMovies) {
      emite(MoviesFavoriteLoadedState(favoriteMovies: favoriteMovies));
    });

    loadingBloc.add(FinishLoadingEvent());
  }

////////////////////////////////////////////////////////////////////////////////////////
  Future<void> _onMoviesFavoriteDeleteMovieEvent(
    MoviesFavoriteDeleteMovieEvent event,
    Emitter<MoviesFavoriteState> emite,
  ) async {
    await deleteFavoriteMovieUsecase.call(event.movieId);
    final response = await getAllFavoriteMoviesUsecase.call(NoParameters());
    response.fold(
        (l) => emite(MoviesFavoriteErrorState(errorType: l.errorType)),
        (r) => emite(MoviesFavoriteLoadedState(favoriteMovies: r)));
  }
////////////////////////////////////////////////////////////////////////////////////////
}
