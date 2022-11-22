import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/routes_list.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';

class MoviesCarouselCard extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MoviesCarouselCard({
    super.key,
    required this.movieId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context)
        //.pushNamed(RoutesList.movieDetails, arguments: movieId);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MovieDetailsScreen(movieId: movieId)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: ApiConstants.getPosterPath(posterPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
