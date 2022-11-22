import 'package:flutter/material.dart ';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';

class MoviesTabsCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;
  const MoviesTabsCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MovieDetailsScreen(movieId: movieId)));
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.getPosterPath(posterPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              title.intelTrim,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
