import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/usecases/get_preferred_theme_mode_usecase.dart';
import 'package:movies_app/domain/usecases/save_preferred_theme_mode_usecase.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  final SavePreferredThemeModeUsecase savePreferredThemeModeUsecase;
  final GetPreferredThemeModeUsecase getPreferredThemeModeUsecase;

  ThemeModeBloc(
      this.getPreferredThemeModeUsecase, this.savePreferredThemeModeUsecase)
      : super(ThemeModeInitial()) {
    on<ChangeThemeModeEvent>(_onChangeThemeModeEvent);
    on<GetThemeModeEvent>(_onGetThemeModeEvent);
  }

  Future<void> _onChangeThemeModeEvent(
      ChangeThemeModeEvent event, Emitter<ThemeModeState> emite) async {
    final response = await savePreferredThemeModeUsecase.call(event.themeMode);
    response.fold((appError) {
      emite(ThemeModeErrorState(errorType: appError.errorType));
    }, (r) {
      emite(ThemeModeLoadedState(themeMode: event.themeMode));
    });
  }

  void _onGetThemeModeEvent(
      GetThemeModeEvent event, Emitter<ThemeModeState> emite) {
    final response = getPreferredThemeModeUsecase.call(NoParameters());
    response.fold((appError) {
      emite(ThemeModeErrorState(errorType: appError.errorType));
    }, (themeMode) {
      emite(ThemeModeLoadedState(themeMode: themeMode));
    });
  }
}
