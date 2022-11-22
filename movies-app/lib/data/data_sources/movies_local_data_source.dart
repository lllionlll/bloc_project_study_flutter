import 'package:hive/hive.dart';
import 'package:movies_app/common/constants/database_constants.dart';
import 'package:movies_app/data/tables/movie_table.dart';

abstract class MoviesLocalDatasource {
  Future<void> saveFavoriteMovie(MovieTable movieTable);
  Future<void> deleteFavoriteMovie(int movieId);
  Future<bool> isFavoriteMovieExists(int movieId);
  Future<List<MovieTable>> getAllFavoriteMovies();
}

class MoviesLocalDataSourceImpl extends MoviesLocalDatasource {
  @override
  Future<void> saveFavoriteMovie(MovieTable movieTable) async {
    final favBox = await Hive.openBox(DatabaseConstatns.favoriteMoviesBox);
    await favBox.put(movieTable.id, movieTable);
  }

  @override
  Future<void> deleteFavoriteMovie(int movieId) async {
    final favBox = await Hive.openBox(DatabaseConstatns.favoriteMoviesBox);
    await favBox.delete(movieId);
  }

  @override
  Future<bool> isFavoriteMovieExists(int movieId) async {
    final favBox = await Hive.openBox(DatabaseConstatns.favoriteMoviesBox);
    return favBox.containsKey(movieId);
  }

  @override
  Future<List<MovieTable>> getAllFavoriteMovies() async {
    final favBox = await Hive.openBox(DatabaseConstatns.favoriteMoviesBox);
    List<MovieTable> favMovies = [];
    final boxKeys = favBox.keys;
    boxKeys.forEach((movieId) {
      final movie = favBox.get(movieId);
      favMovies.add(movie);
    });

    return favMovies;
  }
}
