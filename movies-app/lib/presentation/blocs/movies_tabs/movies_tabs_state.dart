part of 'movies_tabs_bloc.dart';

abstract class MoviesTabsState extends Equatable {
  const MoviesTabsState();

  @override
  List<Object> get props => [];
}

class MoviesTabsInitialState extends MoviesTabsState {
  const MoviesTabsInitialState();
}

class MovieTabsLoadingState extends MoviesTabsState {}

class MoviesTabsLoadedState extends MoviesTabsState {
  final List<Movie> movies;
  final int currentTabIndex;
  const MoviesTabsLoadedState(
      {required this.movies, required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MoviesTabsErrorState extends MoviesTabsState {
  final ErrorType errorType;
  final int currentTabIndex;

  const MoviesTabsErrorState({
    required this.errorType,
    required this.currentTabIndex,
  });

  @override
  List<Object> get props => [currentTabIndex];
}
