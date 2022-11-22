import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';
import 'package:movies_app/presentation/journeys/favorites/favorite_movies_list.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  State<FavoriteMoviesScreen> createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  late MoviesFavoriteBloc _moviesFavoriteBloc;

  @override
  void initState() {
    super.initState();
    _moviesFavoriteBloc = getItInstance();
    _moviesFavoriteBloc.add(MoviesFavoriteGetAllFavoritesEvent());
  }

  @override
  void dispose() {
    _moviesFavoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LanguageConstansts.favoriteMovies.translate(context)),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocProvider<MoviesFavoriteBloc>.value(
          value: _moviesFavoriteBloc,
          child: BlocBuilder<MoviesFavoriteBloc, MoviesFavoriteState>(
              bloc: _moviesFavoriteBloc,
              builder: (context, state) {
                if (state is MoviesFavoriteLoadedState) {
                  return FavoriteMoviesList(
                    movies: state.favoriteMovies,
                  );
                }
                return const SizedBox.shrink();
              })),
    );
  }
}
