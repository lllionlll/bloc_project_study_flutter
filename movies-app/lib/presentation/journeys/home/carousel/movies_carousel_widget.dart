import 'package:flutter/material.dart';

import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/journeys/home/carousel/movie_carousel_separator.dart';
import 'package:movies_app/presentation/journeys/home/carousel/movie_title_widget.dart';
import 'package:movies_app/presentation/journeys/home/carousel/movies_backdrop_widget.dart';
import 'package:movies_app/presentation/journeys/home/carousel/movies_carousel_page_view.dart';
import 'package:movies_app/presentation/widgets/appbar_widget.dart';

class MoviesCarouselWidget extends StatelessWidget {
  final List<Movie> movies;
  final int defaultIndex;
  const MoviesCarouselWidget(
      {super.key, required this.movies, required this.defaultIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MoviesBackdropWidget(),
        Column(
          children: [
            const AppbarWidget(),
            MoviesCarouselPageView(movies: movies, defaultIndex: defaultIndex),
            const MovieTitleWidget(),
            const MovieCarouselSeparator(),
          ],
        ),
      ],
    );
  }
}
