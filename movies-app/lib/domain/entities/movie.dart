// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  const Movie({
    this.backdropPath,
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      title,
      overview,
      posterPath,
      releaseDate,
      voteAverage,
    ];
  }
}
