// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movies_app/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    super.id,
    super.title,
    super.overview,
    super.releaseDate,
    super.voteAverage,
    super.backdropPath,
    super.posterPath,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
    );
  }
}
