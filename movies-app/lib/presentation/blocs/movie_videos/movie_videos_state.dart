part of 'movie_videos_bloc.dart';

abstract class MovieVideosState extends Equatable {
  const MovieVideosState();

  @override
  List<Object> get props => [];
}

class MovieVideosInitialState extends MovieVideosState {}

class MovieVideosLoadingState extends MovieVideosState {}

class MovieVideosErrorState extends MovieVideosState {
  final ErrorType errorType;
  const MovieVideosErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}

class MovieVideosLoadedState extends MovieVideosState {
  final List<Video> movieVideos;
  const MovieVideosLoadedState({required this.movieVideos});

  @override
  List<Object> get props => [movieVideos];
}
