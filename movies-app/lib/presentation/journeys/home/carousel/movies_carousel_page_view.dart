import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_backdrop/movies_backdrop_bloc.dart';

import 'package:movies_app/presentation/journeys/home/carousel/animated_movies_carousel_card.dart';
import '../../../../domain/entities/movie.dart';

class MoviesCarouselPageView extends StatefulWidget {
  final List<Movie> movies;
  final int defaultIndex;
  const MoviesCarouselPageView(
      {super.key, required this.movies, required this.defaultIndex});

  @override
  State<MoviesCarouselPageView> createState() => _MoviesCarouselPageViewState();
}

class _MoviesCarouselPageViewState extends State<MoviesCarouselPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.defaultIndex,
      viewportFraction: 0.7,
      keepPage: false,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: MediaQuery.of(context).size.height * 0.35,
      child: PageView.builder(
        itemBuilder: ((ctx, index) {
          final movie = widget.movies[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedMoviesCarouselCard(
              movieId: movie.id!,
              posterPath: movie.posterPath!,
              index: index,
              pageController: _pageController,
            ),
          );
        }),
        controller: _pageController,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          context
              .read<MoviesBackdropBloc>()
              .add(LoadMovieBackdropEvent(movie: widget.movies[index]));
        },
      ),
    );
  }
}
