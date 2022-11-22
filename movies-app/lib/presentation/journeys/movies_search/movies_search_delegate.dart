import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/search_movies_parameters.dart';
import 'package:movies_app/presentation/blocs/movies_search/movies_search_bloc.dart';
import 'package:movies_app/presentation/journeys/movies_search/movie_search_card.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

class MoviesSearchDelegate extends SearchDelegate {
  final MoviesSearchBloc moviesSearchBloc;

  MoviesSearchDelegate({required this.moviesSearchBloc});
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query.isEmpty
              ? null
              : () {
                  query = '';
                  moviesSearchBloc.add(LoadMoviesSearchEvent(
                      searchMoviesParameters:
                          SearchMoviesParameters(queryText: query)));
                },
          icon: Icon(
            Icons.clear,
            color: query.isEmpty ? Colors.grey : Appcolors.royalBlue,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //pass back null
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length > 2) {
      moviesSearchBloc.add(LoadMoviesSearchEvent(
          searchMoviesParameters: SearchMoviesParameters(queryText: query)));
    }
    return BlocBuilder<MoviesSearchBloc, MoviesSearchState>(
        bloc: moviesSearchBloc,
        builder: (context, state) {
          if (state is MoviesSearchErrorState) {
            //TODO: check if there error message, then display the message instead of AppErrorWidget
            return Center(
              child: AppErrorWidget(
                errorType: state.errorType,
                handleRetryPress: () {
                  moviesSearchBloc.add(LoadMoviesSearchEvent(
                      searchMoviesParameters:
                          SearchMoviesParameters(queryText: query)));
                },
              ),
            );
          } else if (state is MoviesSearchLoadedState) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    LanguageConstansts.searchResultsNotFound.translate(context),
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (ctx, i) => MovieSearchCard(movie: movies[i]),
              itemCount: movies.length,
            );
          }
          return const SizedBox.shrink();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
