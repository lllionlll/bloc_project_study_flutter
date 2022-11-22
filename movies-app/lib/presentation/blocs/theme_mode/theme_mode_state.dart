part of 'theme_mode_bloc.dart';

abstract class ThemeModeState extends Equatable {
  const ThemeModeState();

  @override
  List<Object> get props => [];
}

class ThemeModeInitial extends ThemeModeState {}

class ThemeModeLoadedState extends ThemeModeState {
  final ThemeMode themeMode;
  const ThemeModeLoadedState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

class ThemeModeErrorState extends ThemeModeState {
  final ErrorType errorType;
  const ThemeModeErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}
