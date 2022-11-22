part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {
  final ErrorType errorType;
  const MovieDetailsErrorState({required this.errorType});
  @override
  List<Object> get props => [errorType];
}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetails movieDetails;
  const MovieDetailsLoadedState({required this.movieDetails});
  @override
  List<Object> get props => [movieDetails];
}
