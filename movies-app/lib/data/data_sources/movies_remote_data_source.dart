import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/data/models/cast_member_model.dart';
import 'package:movies_app/data/models/cast_result_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';

import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';
import 'package:movies_app/data/models/video_model.dart';
import 'package:movies_app/data/models/videos_result_model.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<List<CastMemberModel>> getMovieCastMembers(int movieId);
  Future<List<VideoModel>> getMovieVideos(int movieId);
  Future<List<MovieModel>> getSearchMovies(SearchMoviesParameters parameters);
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstants.TRENDING_MOVIES_URL));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final movies = MoviesResultModel.fromJson(decodedResponse).movies;
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(ApiConstants.POPULAR_MOVIES_URL));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return MoviesResultModel.fromJson(decodedResponse).movies;
    } else {
      throw (Exception(response.reasonPhrase));
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstants.NOW_PLAYING_MOVIES_URL));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return MoviesResultModel.fromJson(decodedResponse).movies;
    } else {
      throw (Exception(response.reasonPhrase));
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstants.UPCOMING_MOVIES_URL));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return MoviesResultModel.fromJson(decodedResponse).movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final response =
        await http.get(Uri.parse(ApiConstants.getMovieDetailsUrl(movieId)));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(decodedResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<CastMemberModel>> getMovieCastMembers(int movieId) async {
    final response =
        await http.get(Uri.parse(ApiConstants.getMovieCastUrl(movieId)));
    if (response.statusCode == 200) {
      final decodedReposnse = jsonDecode(response.body);
      final List<CastMemberModel> castMembers =
          CastResultModel.fromJson(decodedReposnse).castMembers;
      return castMembers;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    final response =
        await http.get(Uri.parse(ApiConstants.getMovieVideosUrl(movieId)));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final List<VideoModel> videos =
          VideosResultModel.fromJson(decodedResponse).videos;
      return videos;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getSearchMovies(
      SearchMoviesParameters parameters) async {
    final queries = parameters.toMap();
    print(ApiConstants.getMoviesSearchUrl(queries));
    final response =
        await http.get(Uri.parse(ApiConstants.getMoviesSearchUrl(queries)));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final movies = MoviesResultModel.fromJson(decodedResponse).movies;
      return movies;
    } else {
      //TODO: can differ error types(could create ApiException)
      throw Exception(decodedResponse['errors'][0] ?? response.reasonPhrase);
    }
  }
}
