import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(StartLoadingState()) {
    on<StartLoadingEvent>((event, emit) {
      emit(StartLoadingState());
    });
    on<FinishLoadingEvent>((event, emit) {
      emit(FinishLoadingState());
    });
  }
}
