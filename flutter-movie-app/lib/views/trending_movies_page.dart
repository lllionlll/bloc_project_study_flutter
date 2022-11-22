import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/trending_movies/trending_movies_cubit.dart';
import 'package:movie_app/cubit/trending_movies/trending_movies_state.dart';
import 'package:movie_app/widgets/gridview_movie.dart';

import 'package:movie_app/widgets/reload_state_button.dart';

class TrendingMoviesPage extends StatefulWidget {
  const TrendingMoviesPage({super.key});

  @override
  State<TrendingMoviesPage> createState() => _PopularMovie();
}

class _PopularMovie extends State<TrendingMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double maxHeight = constraints.maxHeight;

      return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: ReloadStateButton(
                  size: maxWidth,
                  onPressed: () {
                    context.read<TrendingMoviesCubit>().getTrendingMovies();
                  }),
            );
          } else if (state is SuccessState) {
            List movies = state.trendingMovies;

            return GridViewMovie(
                maxHeight: maxHeight, maxWidth: maxWidth, movie: movies);
          }

          return const Center();
        },
      );
    });
  }
}
