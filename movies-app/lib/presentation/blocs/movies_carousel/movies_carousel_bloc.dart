import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/usecases/get_trending_movies_usecase.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_backdrop/movies_backdrop_bloc.dart';

part 'movies_carousel_event.dart';
part 'movies_carousel_state.dart';

class MoviesCarouselBloc
    extends Bloc<MoviesCarouselEvent, MoviesCarouselState> {
  final GetTrendingMoviesUsecase getTrendingMoviesUsecase;
  final MoviesBackdropBloc moviesBackdropBloc;
  final LoadingBloc loadingBloc;
  MoviesCarouselBloc({
    required this.getTrendingMoviesUsecase,
    required this.moviesBackdropBloc,
    required this.loadingBloc,
  }) : super(MoviesCarouselInitialState()) {
    on<MoviescarouselLoadEvent>(_onLoadMoviesCarouselEvent);
  }

  Future<void> _onLoadMoviesCarouselEvent(
      MoviescarouselLoadEvent event, Emitter<MoviesCarouselState> emit) async {
    loadingBloc.add(StartLoadingEvent());
    final response = await getTrendingMoviesUsecase.call(NoParameters());
    response.fold(
      (appError) =>
          emit(MoviesCarouselErrorState(errorType: appError.errorType)),
      (movies) {
        // Fire loading first movie backDrop
        moviesBackdropBloc
            .add(LoadMovieBackdropEvent(movie: movies[event.defaultIndex]));
        emit(
          MoviesCarouselLoadedState(
            carouselMovies: movies,
            defaultIndex: event.defaultIndex,
          ),
        );
      },
    );
    loadingBloc.add(FinishLoadingEvent());
  }
}
