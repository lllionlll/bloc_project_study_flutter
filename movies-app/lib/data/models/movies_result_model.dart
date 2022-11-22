import 'package:movies_app/data/models/movie_model.dart';

class MoviesResultModel {
  final List<MovieModel> movies;

  const MoviesResultModel(this.movies);

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    final movies = List<MovieModel>.from(
        json['results'].map((movie) => MovieModel.fromJson(movie)));
    return MoviesResultModel(movies);
  }
}
