import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_with_bloc/api_key/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_with_bloc/models/genres.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc() : super(GenresInitial()) {
    on<GetGenresDetails>((event, emit) async {
      emit(GenresInitial());
      try {
        String url =
            "https://api.themoviedb.org/3/movie/${event.movieId}?api_key=$apiKey";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final genres = Genres.fromJson(json.decode(response.body));
          log('genres => ${response.body}');
          emit(GenresLoaded(genresList: genres.genres));
        }
      } catch (e) {
        emit(GenresFailed(errorGenresText: e.toString()));
      }
    });
  }
}
