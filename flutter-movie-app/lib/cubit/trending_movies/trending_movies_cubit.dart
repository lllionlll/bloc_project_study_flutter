import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/trending_movies/trending_movies_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository;

  Future<void> getTrendingMovies() async {
    try {
      emit(LoadingState());
      final response = await repository.getTrendingMovies();
      emit(SuccessState(trendingMovies: response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
