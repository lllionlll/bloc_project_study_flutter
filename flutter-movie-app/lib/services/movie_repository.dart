import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/popular_movies_model.dart';
import 'package:movie_app/models/trending_movies_model.dart';
import 'package:movie_app/services/api_base_options.dart';

class MovieRepository {
  final Dio _dio = Dio(dioOptions);

  Future<List<PopularMoviesModel>> getPopularMovies({required int page}) async {
    try {
      Response response = await _dio.get('/movie/popular?page=$page');
      final data = response.data;
      List<PopularMoviesModel> movies = data['results']
          .map<PopularMoviesModel>(
              (movies) => PopularMoviesModel.fromJson(movies))
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetailModel> getMovieDetail({required int id}) async {
    try {
      Response response = await _dio.get('/movie/$id');
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TrendingMoviesModel>> getTrendingMovies() async {
    try {
      Response response = await _dio.get('/trending/movie/day?');
      final data = response.data;
      List<TrendingMoviesModel> trendingMovies = data['results']
          .map<TrendingMoviesModel>(
              (movies) => TrendingMoviesModel.fromJson(movies))
          .toList();

      return trendingMovies;
    } catch (e) {
      rethrow;
    }
  }
}
