part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

class MovieCastInitialState extends MovieCastState {}

class MovieCastLoadingState extends MovieCastState {}

class MovieCastErrorState extends MovieCastState {
  final ErrorType errorType;
  const MovieCastErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}

class MovieCastLoadedState extends MovieCastState {
  final List<CastMember> castMembers;
  const MovieCastLoadedState({required this.castMembers});
}
