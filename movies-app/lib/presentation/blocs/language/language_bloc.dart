import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/Language.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_parameters.dart';
import 'package:movies_app/domain/usecases/get_preferred_language_usecase.dart';
import 'package:movies_app/domain/usecases/save_preferred_language_usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  GetPreferredLanguageUsecase getPreferredLanguageUsecase;
  SavePreferredLanguageUsecase savePreferredLanguageUsecase;
  LanguageBloc({
    required this.getPreferredLanguageUsecase,
    required this.savePreferredLanguageUsecase,
  }) : super(LanguageLoadingState()) {
    on<ChangePrefferedLanguageEvent>(_onChangePrefferedLanguageEvent);
    on<GetPreferredLanguageEvent>(_onGetPreferredLanguageEvent);
  }

  Future<void> _onChangePrefferedLanguageEvent(
      ChangePrefferedLanguageEvent event, Emitter<LanguageState> emite) async {
    final response =
        await savePreferredLanguageUsecase.call(event.language.code);
    response.fold((appError) {
      emite(const LanguageErrorState(errorType: ErrorType.api));
    }, (r) {
      emite(LanguageLoadedState(locale: Locale(event.language.code)));
    });
  }

  void _onGetPreferredLanguageEvent(
      GetPreferredLanguageEvent event, Emitter<LanguageState> emite) async {
    final response = await getPreferredLanguageUsecase.call(NoParameters());
    print(response);
    response.fold((appError) {
      emite(const LanguageErrorState(errorType: ErrorType.api));
    }, (langCode) {
      emite(LanguageLoadedState(locale: Locale(langCode)));
    });
  }
}
