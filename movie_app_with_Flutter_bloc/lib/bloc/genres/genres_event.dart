part of 'genres_bloc.dart';

abstract class GenresEvent extends Equatable {
  const GenresEvent();

  @override
  List<Object> get props => [];
}

class GetGenresDetails extends GenresEvent {
  final int movieId;

  const GetGenresDetails(this.movieId);
}
