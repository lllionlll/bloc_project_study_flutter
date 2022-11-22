import 'package:equatable/equatable.dart';
import 'package:movie_app/models/popular_movies_model.dart';

abstract class PopularMoviesState extends Equatable {}

class InitialState extends PopularMoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PopularMoviesState {
  @override
  List<Object> get props => [];
}

class SuccessState extends PopularMoviesState {
  SuccessState({required this.popularMovies});
  final List<PopularMoviesModel> popularMovies;

  @override
  List<Object> get props => [popularMovies];
}

class ErrorState extends PopularMoviesState {
  @override
  List<Object> get props => [];
}
