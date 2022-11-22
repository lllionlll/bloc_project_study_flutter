import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_state.dart';
import 'package:movie_app/models/popular_movies_model.dart';
import 'package:movie_app/widgets/gridview_movie.dart';
import 'package:movie_app/widgets/reload_state_button.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PopularMoviesPage> {
  final List<PopularMoviesModel> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _onScroll();
  }

  void _onScroll() {
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          !context.read<PopularMoviesCubit>().isLoading) {
        context.read<PopularMoviesCubit>().getPopularMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double maxHeight = constraints.maxHeight;

      return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
           return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: ReloadStateButton(
                  size: maxHeight,
                  onPressed: () {
                    context.read<PopularMoviesCubit>().getPopularMovies();
                  }),
            );
          } else if (state is SuccessState) {
            _movies.addAll(state.popularMovies);
          }
          return GridViewMovie(
              maxHeight: maxHeight,
              maxWidth: maxWidth,
              scrollController: _scrollController,
              movie: _movies);
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
