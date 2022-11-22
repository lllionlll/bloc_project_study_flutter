part of 'movies_search_bloc.dart';

abstract class MoviesSearchEvent extends Equatable {
  const MoviesSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadMoviesSearchEvent extends MoviesSearchEvent {
  final SearchMoviesParameters searchMoviesParameters;
  const LoadMoviesSearchEvent({required this.searchMoviesParameters});
}
