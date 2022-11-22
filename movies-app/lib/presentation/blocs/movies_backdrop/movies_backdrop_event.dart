part of 'movies_backdrop_bloc.dart';

abstract class MoviesBackdropEvent extends Equatable {
  const MoviesBackdropEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieBackdropEvent extends MoviesBackdropEvent {
  final Movie movie;
  const LoadMovieBackdropEvent({required this.movie});
  @override
  List<Object> get props => [movie];
}
