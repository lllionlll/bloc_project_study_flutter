import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';
import 'package:movies_app/domain/usecases/get_search_movies_usecase.dart';

part 'movies_search_event.dart';
part 'movies_search_state.dart';

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  final GetSearchMoviesUsecase searchMoviesUsecase;
  MoviesSearchBloc({required this.searchMoviesUsecase})
      : super(MoviesSearchInitialState()) {
    on<LoadMoviesSearchEvent>(_onLoadMoviesSearchEvent);
  }

  Future<void> _onLoadMoviesSearchEvent(
      LoadMoviesSearchEvent event, Emitter<MoviesSearchState> emite) async {
    final response =
        await searchMoviesUsecase.call(event.searchMoviesParameters);
    response.fold((appError) {
      emite(MoviesSearchErrorState(errorType: appError.errorType));
    }, (movies) {
      emite(MoviesSearchLoadedState(movies: movies));
    });
  }
}
