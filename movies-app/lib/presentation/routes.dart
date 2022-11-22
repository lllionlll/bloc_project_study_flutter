import 'package:flutter/cupertino.dart';
import 'package:movies_app/common/constants/routes_list.dart';
import 'package:movies_app/domain/entities/video.dart';
import 'package:movies_app/domain/entities/watch_videos_arguments.dart';
import 'package:movies_app/presentation/journeys/favorites/favorite_movies_screen.dart';
import 'package:movies_app/presentation/journeys/home/home_screen.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:movies_app/presentation/journeys/watch_videos/watch_videos_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) {
    return {
      RoutesList.initial: (context) => const HomeScreen(),
      RoutesList.favoriteMovies: (context) => const FavoriteMoviesScreen(),
      RoutesList.movieDetails: (context) =>
          MovieDetailsScreen(movieId: settings.arguments as int),
      RoutesList.watchTrailler: (context) => WatchVideosScreen(
          watchVideosArguments:
              WatchVideosArguments(videos: settings.arguments as List<Video>)),
    };
  }
}
