part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class Castloaded extends CastState {
  final List<Cast> castList;

  const Castloaded({required this.castList});
}

class CastFailed extends CastState {
  final String errorCastText;

  const CastFailed({required this.errorCastText});
}
