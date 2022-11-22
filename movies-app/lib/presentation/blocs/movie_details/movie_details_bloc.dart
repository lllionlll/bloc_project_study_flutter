import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final MovieCastBloc movieCastBloc;
  final MovieVideosBloc movieVideosBloc;
  final MoviesFavoriteBloc moviesFavoriteBloc;
  final LoadingBloc loadingBloc;
  MovieDetailsBloc({
    required this.getMovieDetailsUsecase,
    required this.movieCastBloc,
    required this.movieVideosBloc,
    required this.moviesFavoriteBloc,
    required this.loadingBloc,
  }) : super(MovieDetailsLoadingState()) {
    //print("MovieDetailsBloc Created with hashCode: ${hashCode}");
    on<LoadMovieDetailsEvent>(_onLoadMovieDetailsEvent);
  }

  Future<void> _onLoadMovieDetailsEvent(
      LoadMovieDetailsEvent event, Emitter<MovieDetailsState> emite) async {
    loadingBloc.add(StartLoadingEvent());
    final response = await getMovieDetailsUsecase
        .call(MovieDetailsParameters(movieId: event.movieId));
    response.fold((appError) {
      emite(MovieDetailsErrorState(errorType: appError.errorType));
    }, (movieDetails) {
      movieCastBloc.add(LoadMovieCastEvent(movieId: event.movieId));
      movieVideosBloc.add(LoadMovieVideosEvent(movieId: event.movieId));
      moviesFavoriteBloc
          .add(MoviesFavoriteCheckIfFavoriteEvent(movieId: event.movieId));
      emite(MovieDetailsLoadedState(movieDetails: movieDetails));
    });
    loadingBloc.add(FinishLoadingEvent());
  }
}
