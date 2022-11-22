import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({required this.repository}) : super(InitialState()) {
    getPopularMovies();
  }

  final MovieRepository repository;
  int initialPage = 0;
  bool isLoading = false;

  Future<void> getPopularMovies() async {
    try {
      emit(LoadingState());

      isLoading = true;
      initialPage++;
      
      final response = await repository.getPopularMovies(page: initialPage);

      emit(SuccessState(popularMovies: response));
      isLoading = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
