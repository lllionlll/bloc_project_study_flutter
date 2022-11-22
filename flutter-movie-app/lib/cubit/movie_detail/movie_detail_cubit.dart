import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({required this.repository}) : super(InitialState());

  final MovieRepository repository;

  Future<void> getMovieDetail({required int id}) async {
    try {
      emit(LoadingState());
      final response = await repository.getMovieDetail(id: id);
      emit(SuccessState(movie: response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
