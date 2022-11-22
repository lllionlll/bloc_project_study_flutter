import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_upcoming_movies_usecase.dart';

import '../../../domain/entities/app_error.dart';

part 'movies_tabs_event.dart';
part 'movies_tabs_state.dart';

class MoviesTabsBloc extends Bloc<MoviesTabsEvent, MoviesTabsState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;

  MoviesTabsBloc({
    required this.getNowPlayingMoviesUsecase,
    required this.getPopularMoviesUsecase,
    required this.getUpcomingMoviesUsecase,
  }) : super(const MoviesTabsInitialState()) {
    on<ChangeMoviesTabEvent>(_onChangeMoviesTabEvent);
  }

  Future<void> _onChangeMoviesTabEvent(
      ChangeMoviesTabEvent event, Emitter<MoviesTabsState> emit) async {
    emit(MovieTabsLoadingState());
    late Either<AppError, List<Movie>> response;
    switch (event.tabIndex) {
      case 0:
        response = await getPopularMoviesUsecase.call(NoParameters());
        break;
      case 1:
        response = await getNowPlayingMoviesUsecase.call(NoParameters());
        break;
      case 2:
        response = await getUpcomingMoviesUsecase.call(NoParameters());
        break;
    }

    response.fold(
      (appError) => emit(MoviesTabsErrorState(
          errorType: appError.errorType, currentTabIndex: event.tabIndex)),
      (movies) => emit(
        MoviesTabsLoadedState(movies: movies, currentTabIndex: event.tabIndex),
      ),
    );
  }
}
