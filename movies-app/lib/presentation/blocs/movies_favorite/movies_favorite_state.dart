part of 'movies_favorite_bloc.dart';

abstract class MoviesFavoriteState extends Equatable {
  const MoviesFavoriteState();

  @override
  List<Object> get props => [];
}

class MoviesFavoriteInitialState extends MoviesFavoriteState {}

class MoviesFavoriteLoadingState extends MoviesFavoriteState {}

class MoviesFavoriteErrorState extends MoviesFavoriteState {
  final ErrorType errorType;
  const MoviesFavoriteErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}

class MoviesFavoriteIsFavoriteOrNotState extends MoviesFavoriteState {
  final bool isFavorite;
  final int movieId;
  const MoviesFavoriteIsFavoriteOrNotState(
      {required this.isFavorite, required this.movieId});

  @override
  List<Object> get props => [isFavorite];
}

class MoviesFavoriteLoadedState extends MoviesFavoriteState {
  final List<MovieTable> favoriteMovies;
  const MoviesFavoriteLoadedState({required this.favoriteMovies});

  @override
  List<Object> get props => [favoriteMovies];
}
