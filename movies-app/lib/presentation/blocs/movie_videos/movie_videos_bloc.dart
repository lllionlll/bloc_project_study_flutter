import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/entities/video.dart';
import 'package:movies_app/domain/usecases/get_movie_videos_usecase.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

part 'movie_videos_event.dart';
part 'movie_videos_state.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  final GetMovieVideowUsecase getMovieVideowUsecase;

  MovieVideosBloc({
    required this.getMovieVideowUsecase,
  }) : super(MovieVideosLoadingState()) {
    on<LoadMovieVideosEvent>(_onLoadMovieVideosEvent);
  }

  Future<void> _onLoadMovieVideosEvent(
      LoadMovieVideosEvent event, Emitter<MovieVideosState> emite) async {
    final Either<AppError, List<Video>> response = await getMovieVideowUsecase
        .call(MovieDetailsParameters(movieId: event.movieId));
    response.fold((appError) {
      emite(MovieVideosErrorState(errorType: appError.errorType));
    }, (movieVideos) {
      emite(MovieVideosLoadedState(movieVideos: movieVideos));
    });
  }
}
