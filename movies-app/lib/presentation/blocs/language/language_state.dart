part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoadingState extends LanguageState {}

class LanguageErrorState extends LanguageState {
  final ErrorType errorType;
  const LanguageErrorState({required this.errorType});
  @override
  List<Object> get props => [errorType];
}

class LanguageLoadedState extends LanguageState {
  final Locale locale;
  const LanguageLoadedState({required this.locale});
  @override
  List<Object> get props => [locale.languageCode];
}
