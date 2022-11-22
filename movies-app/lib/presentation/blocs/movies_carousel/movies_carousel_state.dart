part of 'movies_carousel_bloc.dart';

abstract class MoviesCarouselState extends Equatable {
  const MoviesCarouselState();

  @override
  List<Object> get props => [];
}

class MoviesCarouselInitialState extends MoviesCarouselState {}

class MoviesCarouselErrorState extends MoviesCarouselState {
  final ErrorType errorType;
  const MoviesCarouselErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}

class MoviesCarouselLoadedState extends MoviesCarouselState {
  final List<Movie> carouselMovies;
  final int defaultIndex;

  const MoviesCarouselLoadedState(
      {required this.carouselMovies, this.defaultIndex = 0});

  @override
  List<Object> get props => [carouselMovies, defaultIndex];
}
