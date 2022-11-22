part of 'movies_backdrop_bloc.dart';

abstract class MoviesBackdropState extends Equatable {
  const MoviesBackdropState();

  @override
  List<Object> get props => [];
}

class MoviesBackdropInitialState extends MoviesBackdropState {}

class MoviesBackdropLoadedState extends MoviesBackdropState {
  final Movie movie;
  const MoviesBackdropLoadedState({required this.movie});

  @override
  List<Object> get props => [movie];
}
