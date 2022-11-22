part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  const LoadMovieDetailsEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}
