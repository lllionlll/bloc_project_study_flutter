part of 'genres_bloc.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoaded extends GenresState {
  final List<Genre>? genresList;

  const GenresLoaded({required this.genresList});
}

class GenresFailed extends GenresState {
  final String errorGenresText;

  const GenresFailed({required this.errorGenresText});
}
