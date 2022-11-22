import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/domain/entities/movie_details_parameters.dart';
import 'package:movies_app/domain/usecases/get_movie_cast_members_usecase.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final GetMovieCastMembersUsecase getMovieCastMembersUsecase;
  MovieCastBloc({required this.getMovieCastMembersUsecase})
      : super(MovieCastLoadingState()) {
    print("MovieCastBloc Created with hash $hashCode");
    on<LoadMovieCastEvent>(_onLoadMovieCastEvent);
  }

  Future<void> _onLoadMovieCastEvent(
      LoadMovieCastEvent event, Emitter<MovieCastState> emite) async {
    emite(MovieCastLoadingState());
    final response = await getMovieCastMembersUsecase
        .call(MovieDetailsParameters(movieId: event.movieId));
    response.fold((appError) {
      emite(MovieCastErrorState(errorType: appError.errorType));
    }, (castMembers) {
      emite(MovieCastLoadedState(castMembers: castMembers));
    });
  }
}
