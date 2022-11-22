part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final Movie movieList;

  const MoviesLoaded({required this.movieList});
}

class MoviesFailed extends MoviesState {
  final String errorText;

  const MoviesFailed({required this.errorText});
}
