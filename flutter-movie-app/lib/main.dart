import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_app/cubit/trending_movies/trending_movies_cubit.dart';
import 'package:movie_app/utils/routes.dart';
import 'package:movie_app/utils/theme.dart';
import 'package:movie_app/views/movie_home_page.dart';

import 'services/movie_repository.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieDetailCubit(repository: MovieRepository()),
        ),
        BlocProvider(
          create: (_) => TrendingMoviesCubit(repository: MovieRepository()),
        ),
        BlocProvider(
          create: (_) => PopularMoviesCubit(repository: MovieRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: MovieTheme.dark,
        home: const MovieHomePage(),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
