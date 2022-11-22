import 'package:flutter/material.dart';
import 'package:movie_app/views/movie_detail_page.dart';
import 'package:movie_app/views/movie_home_page.dart';
import 'package:movie_app/views/popular_movies_page.dart';
import 'package:movie_app/views/trending_movies_page.dart';

abstract class Routes {
  static const String popularMovies = '/popular_movies';
  static const String movieDetail = '/movie_detail';
  static const String trendingMovies = '/trending_movies';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case movieDetail:
        return MaterialPageRoute(
          builder: (context) => MovieDetailPage(movieId: args),
        );

      case trendingMovies:
        return MaterialPageRoute(
          builder: (context) => const TrendingMoviesPage(),
        );

      case popularMovies:
        return MaterialPageRoute(
          builder: (context) => const PopularMoviesPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const MovieHomePage(),
        );
    }
  }
}
