import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_app_bloc/model/movie_actor_model.dart';
import 'package:movie_app_bloc/model/movie_model.dart';
import 'package:movie_app_bloc/model/tvseries_actor_model.dart';
import 'package:movie_app_bloc/model/tvseries_model.dart';

import '../../model/actor_details_model.dart';
import '../json_services/json_services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  Future<List<Results>?> startAll() async {
    try {
      emit(MovieLoading());
      List<Results>? popularMovieModelList =
          await JsonServices().fetchPopularMovies();
      List<Results>? trendingMoviesModelList =
          await JsonServices().fetchTrendingMovies();
      List<Results>? upcomingMovieModelList =
          await JsonServices().fetchUpcomingMovies();

      Future.delayed(const Duration(seconds: 1));
      emit(StartAllMovieServices(
        trendingMoviesModelList,
        popularMovieModelList,
        upcomingMovieModelList,
      ));
      FlutterNativeSplash.remove();
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<Results>?> getTrendingMoviesCubit() async {
    try {
      emit(MovieLoading());
      List<Results>? trendingMoviesModelList =
          await JsonServices().fetchTrendingMovies();
      Future.delayed(const Duration(seconds: 1));
      emit(GetTrendingMovieState(trendingMoviesModelList));
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<Results>?> getPopularMoviesCubit() async {
    try {
      emit(MovieLoading());
      List<Results>? popularMoviesModelList =
          await JsonServices().fetchTrendingMovies();
      Future.delayed(const Duration(seconds: 1));
      emit(GetTrendingMovieState(popularMoviesModelList));
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<Results>?> getUpcomingMovies() async {
    try {
      emit(MovieLoading());
      List<Results>? upcomingMovieList =
          await JsonServices().fetchUpcomingMovies();
      Future.delayed(const Duration(seconds: 1));
      emit(UpcomingMovieState(upcomingMovieList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<Map<String, dynamic>?> getMovieDetails(String movieId) async {
    try {
      emit(MovieLoading());
      Map<String, dynamic>? popularMoviesModelList =
          await JsonServices().fetchMovieDetails(movieId);
      List<MovieActorModel>? movieActorModelList =
          await JsonServices().fetchMovieActors(movieId);
      Future.delayed(const Duration(seconds: 1));
      emit(GetMovieDataState(popularMoviesModelList, movieActorModelList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<List<MovieActorModel>?> getMovieActors(String id) async {
    try {
      emit(MovieLoading());
      List<MovieActorModel>? movieActorModelList =
          await JsonServices().fetchMovieActors(id);
      Future.delayed(const Duration(seconds: 1));
      emit(GetMovieActorsState(movieActorModelList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<ActorDetailsModel?> getActorDetails(String id) async {
    try {
      emit(MovieLoading());
      ActorDetailsModel? modelItem = await JsonServices().fetchActorDetails(id);
      List<Results>? historyList =
          await JsonServices().fetchActorMovieHistory(id);
      Future.delayed(const Duration(seconds: 1));
      emit(GetActorDetailsState(modelItem, historyList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<List<Results>?> getActorMovieHistory(String id) async {
    try {
      emit(MovieLoading());
      List<Results>? historyList =
          await JsonServices().fetchActorMovieHistory(id);
      Future.delayed(const Duration(seconds: 1));
      emit(GetActorMovieHistoryState(historyList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<List<TvSeriesResult>?> getPopularTvSeries() async {
    try {
      emit(MovieLoading());
      List<TvSeriesResult>? popularTvSeriesList =
          await JsonServices().fetchPopularTvSeries();
      Future.delayed(const Duration(seconds: 1));
      emit(GetPopularTvSeriesState(popularTvSeriesList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<List<TvSeriesResult>?> getTrendingTvSeries() async {
    try {
      emit(MovieLoading());
      List<TvSeriesResult>? trendingTvSeriesList =
          await JsonServices().fetchTrendingTvSeries();
      Future.delayed(const Duration(seconds: 1));
      emit(GetTrendingTvSeriesState(trendingTvSeriesList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<List<Results>?> startallTvSeriesService() async {
    try {
      emit(MovieLoading());
      List<TvSeriesResult>? trendingTvSeriesList =
          await JsonServices().fetchTrendingTvSeries();
      List<TvSeriesResult>? popularTvSeries =
          await JsonServices().fetchPopularTvSeries();
      Future.delayed(const Duration(seconds: 1));
      emit(StartAllTvSeriesServiceState(popularTvSeries, trendingTvSeriesList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }

  Future<Map<String, dynamic>?> getTvSeriesDetails(String id) async {
    try {
      emit(MovieLoading());
      Map<String, dynamic>? popularMoviesModelList =
          await JsonServices().fetchTvSeriesDetails(id);
      List<TvSeriesActorModel>? actorList =
          await JsonServices().fetchTvSeriesActorDetails(id);
      Future.delayed(const Duration(seconds: 1));
      emit(GetTvSeriesDataState(popularMoviesModelList, actorList));
    } catch (e) {
      _ShowDebug.showError(e.toString());
    }
    return null;
  }
}

class _ShowDebug {
  static void showError(String error) {
    if (kDebugMode) {
      print(error);
    }
  }
}
