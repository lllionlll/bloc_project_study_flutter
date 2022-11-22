part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class GetCastDetailes extends CastEvent {
  final String movieId;

  const GetCastDetailes(this.movieId);
}
