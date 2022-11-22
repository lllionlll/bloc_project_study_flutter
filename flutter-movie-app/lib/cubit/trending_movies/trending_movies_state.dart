import 'package:equatable/equatable.dart';
import 'package:movie_app/models/trending_movies_model.dart';

abstract class TrendingMoviesState extends Equatable {}

class InitialState extends TrendingMoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TrendingMoviesState {
  @override
  List<Object> get props => [];
}

class SuccessState extends TrendingMoviesState {
  SuccessState({required this.trendingMovies});
  final List <TrendingMoviesModel> trendingMovies;

  @override
  List<Object> get props => [trendingMovies];
}

class ErrorState extends TrendingMoviesState {
  @override
  List<Object> get props => [];
}
