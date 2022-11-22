part of 'movies_tabs_bloc.dart';

abstract class MoviesTabsEvent extends Equatable {
  const MoviesTabsEvent();

  @override
  List<Object> get props => [];
}

class ChangeMoviesTabEvent extends MoviesTabsEvent {
  final int tabIndex;
  const ChangeMoviesTabEvent({this.tabIndex = 0});
  @override
  List<Object> get props => [tabIndex];
}
