part of 'movies_carousel_bloc.dart';

abstract class MoviesCarouselEvent extends Equatable {
  const MoviesCarouselEvent();

  @override
  List<Object> get props => [];
}

class MoviescarouselLoadEvent extends MoviesCarouselEvent {
  final int defaultIndex;
  const MoviescarouselLoadEvent({this.defaultIndex = 0});

  @override
  List<Object> get props => [defaultIndex];
}
