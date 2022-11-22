part of 'movies_favorite_bloc.dart';

abstract class MoviesFavoriteEvent extends Equatable {
  const MoviesFavoriteEvent();

  @override
  List<Object> get props => [];
}

class MoviesFavoriteCheckIfFavoriteEvent extends MoviesFavoriteEvent {
  final int movieId;
  const MoviesFavoriteCheckIfFavoriteEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}

class MoviesFavoriteToggleFavoriteEvent extends MoviesFavoriteEvent {
  final MovieTable movieTable;
  final bool isFavorite;
  const MoviesFavoriteToggleFavoriteEvent({
    required this.movieTable,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [
        movieTable,
        isFavorite,
      ];
}

class MoviesFavoriteGetAllFavoritesEvent extends MoviesFavoriteEvent {}

class MoviesFavoriteDeleteMovieEvent extends MoviesFavoriteEvent {
  final int movieId;
  const MoviesFavoriteDeleteMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
