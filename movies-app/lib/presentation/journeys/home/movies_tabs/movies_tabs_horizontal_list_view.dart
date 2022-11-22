import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie.dart';

import 'movies_tabs_card_widget.dart';

class MoviesTabsHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  const MoviesTabsHorizontalListView({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          final movie = movies[i];
          return MoviesTabsCardWidget(
            movieId: movie.id!,
            title: movie.title!,
            posterPath: movie.posterPath!,
          );
        },
        separatorBuilder: (ctx, index) => const SizedBox(width: 8),
        itemCount: movies.length);
  }
}
