part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class StartLoadingState extends LoadingState {}

class FinishLoadingState extends LoadingState {}
