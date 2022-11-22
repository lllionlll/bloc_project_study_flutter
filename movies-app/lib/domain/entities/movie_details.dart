// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final String? backdropPath;
  final String? posterPath;

  const MovieDetails({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.posterPath,
  });

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }
}
