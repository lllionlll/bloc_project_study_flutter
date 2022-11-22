import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_app_bar.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/common/extensions/double_extensions.dart';
import 'package:movies_app/domain/entities/movie_details.dart';

class MovieDetailsPosterWidget extends StatelessWidget {
  final MovieDetails movie;
  const MovieDetailsPosterWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                Theme.of(context).primaryColor
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: ApiConstants.getPosterPath(movie.posterPath!),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: ListTile(
            title: Text(
              movie.title!,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate!,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              (movie.voteAverage ?? 0.0).converVoteAverageToPercentageString,
              style: Theme.of(context).textTheme.royalBlueSubtitle1,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 16,
          left: 16,
          child: MovieDetailsAppBar(movieDetails: movie),
        ),
      ],
    );
  }
}
