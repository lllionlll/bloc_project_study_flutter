import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie.dart';

part 'movies_backdrop_event.dart';
part 'movies_backdrop_state.dart';

class MoviesBackdropBloc
    extends Bloc<MoviesBackdropEvent, MoviesBackdropState> {
  MoviesBackdropBloc() : super(MoviesBackdropInitialState()) {
    print("MoviesBackdropBloc Created");
    on<LoadMovieBackdropEvent>(_onLoadMovieBackdropEvent);
  }

  void _onLoadMovieBackdropEvent(
      LoadMovieBackdropEvent event, Emitter<MoviesBackdropState> emit) {
    emit(MoviesBackdropLoadedState(movie: event.movie));
  }
}
