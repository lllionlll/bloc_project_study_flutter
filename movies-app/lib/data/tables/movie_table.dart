import 'package:hive/hive.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/movie_details.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends Movie {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? posterPath;

  const MovieTable({required this.id, this.title, this.posterPath})
      : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: '',
          overview: '',
          releaseDate: '',
          voteAverage: 0.0,
        );
  factory MovieTable.fromMovie(Movie movie) {
    return MovieTable(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
    );
  }
  factory MovieTable.fromMovieDetails(MovieDetails movie) {
    return MovieTable(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
    );
  }
}
