import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/services/cubit/movie_cubit.dart';
import 'package:movie_app_bloc/widget/error_widget.dart';
import 'package:movie_app_bloc/widget/is_loading.dart';

import '../constants/app_padding.dart';
import '../constants/app_text.dart';
import '../widget/movies_list.dart';

class MoviesHomePage extends StatelessWidget {
  const MoviesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..startAll(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieLoading) {
              return const IsLoading();
            } else if (state is StartAllMovieServices) {
              return _homePageMainWidget(context, state);
            } else {
              return const ErrorPage(error: "Error");
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _homePageMainWidget(
      BuildContext context, StartAllMovieServices state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MovieHomePagePadding.minimumValue),
            child: MovieList(
              title: MovieHomePage.trendingMoviesText,
              movieDetailsList: state.trendingMoviesCubitList,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MovieHomePagePadding.minimumValue),
            child: MovieList(
              title: MovieHomePage.popularMoviesText,
              movieDetailsList: state.popularMovieCubitList,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MovieHomePagePadding.minimumValue),
            child: MovieList(
              title: MovieHomePage.upcomingMoviesText,
              movieDetailsList: state.upcomingMovieCubitList,
            ),
          ),
        ],
      ),
    );
  }
}
