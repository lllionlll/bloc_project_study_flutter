import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_with_bloc/api_key/api_key.dart';
import 'package:movies_app_with_bloc/models/movie.dart';
import 'package:http/http.dart' as http;

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<GetCarouselMovies>((event, emit) async {
      emit(MoviesInitial());
      try {
        const url =
            "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final movies = Movie.fromJson(json.decode(response.body));
          log(movies.toString());
          emit(MoviesLoaded(movieList: movies));
        }
      } catch (e) {
        emit(MoviesFailed(errorText: e.toString()));
      }
    });
  }
}
