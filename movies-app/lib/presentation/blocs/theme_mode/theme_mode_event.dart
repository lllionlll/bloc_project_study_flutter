part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();

  @override
  List<Object> get props => [];
}

class GetThemeModeEvent extends ThemeModeEvent {}

class ChangeThemeModeEvent extends ThemeModeEvent {
  final ThemeMode themeMode;
  const ChangeThemeModeEvent({required this.themeMode});
  @override
  List<Object> get props => [];
}
