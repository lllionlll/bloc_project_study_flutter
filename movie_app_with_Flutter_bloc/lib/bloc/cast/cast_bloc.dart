import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_with_bloc/api_key/api_key.dart';
import 'package:movies_app_with_bloc/models/cast.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_with_bloc/models/movie.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<GetCastDetailes>((event, emit) async {
      emit(CastInitial());
      try {
        String url =
            "https://api.themoviedb.org/3/movie/${event.movieId}/credits?api_key=$apiKey";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final casts = Credits.fromJson(jsonDecode(response.body));
          log('cast response =>${response.body}');
          emit(Castloaded(castList: casts.cast!));
        }
      } catch (e) {
        log('cast error=>' + e.toString());
        emit(CastFailed(errorCastText: e.toString()));
      }
    });
  }
}
