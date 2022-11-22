part of 'movie_videos_bloc.dart';

abstract class MovieVideosEvent extends Equatable {
  const MovieVideosEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieVideosEvent extends MovieVideosEvent {
  final int movieId;
  const LoadMovieVideosEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}
