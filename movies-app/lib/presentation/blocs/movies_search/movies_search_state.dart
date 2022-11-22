part of 'movies_search_bloc.dart';

abstract class MoviesSearchState extends Equatable {
  const MoviesSearchState();

  @override
  List<Object> get props => [];
}

class MoviesSearchInitialState extends MoviesSearchState {}

class MoviesSearchLoadingState extends MoviesSearchState {}

class MoviesSearchErrorState extends MoviesSearchState {
  final ErrorType errorType;
  const MoviesSearchErrorState({required this.errorType});
}

class MoviesSearchLoadedState extends MoviesSearchState {
  final List<Movie> movies;
  const MoviesSearchLoadedState({required this.movies});
}
