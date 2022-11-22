import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_cast_widget.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_poster_widget.dart';
import 'package:movies_app/presentation/journeys/movie_details/wath_videos_button_widget.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsBloc _movieDetailsBloc;
  late MovieCastBloc _movieCastBloc;
  late MovieVideosBloc _movieVideosBloc;
  late MoviesFavoriteBloc _moviesFavoriteBloc;
  @override
  void initState() {
    super.initState();
    _movieDetailsBloc = getItInstance();
    _movieDetailsBloc.add(LoadMovieDetailsEvent(movieId: widget.movieId));
    _movieCastBloc = _movieDetailsBloc.movieCastBloc;
    _movieVideosBloc = _movieDetailsBloc.movieVideosBloc;
    _moviesFavoriteBloc = _movieDetailsBloc.moviesFavoriteBloc;
  }

  @override
  void dispose() {
    _movieDetailsBloc.close();
    _movieCastBloc.close();
    _movieVideosBloc.close();
    _moviesFavoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsBloc>.value(value: _movieDetailsBloc),
        BlocProvider<MovieCastBloc>.value(value: _movieCastBloc),
        BlocProvider<MovieVideosBloc>.value(value: _movieVideosBloc),
        BlocProvider<MoviesFavoriteBloc>.value(value: _moviesFavoriteBloc),
      ],
      child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsErrorState) {
                return AppErrorWidget(
                    errorType: state.errorType,
                    handleRetryPress: () {
                      _movieDetailsBloc
                          .add(LoadMovieDetailsEvent(movieId: widget.movieId));
                    });
              } else if (state is MovieDetailsLoadedState) {
                final movie = state.movieDetails;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieDetailsPosterWidget(movie: movie),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          movie.overview!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Text(
                          LanguageConstansts.cast.translate(context),
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      MovieDetailsCastWidget(movieId: widget.movieId),
                      WatchVideosButtonWidget(movieId: widget.movieId),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
