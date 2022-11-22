import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_details/cast_card_widget.dart';
import 'package:movies_app/presentation/journeys/movie_details/cast_list_view.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  // for retry loading the cast again
  final int movieId;
  const MovieDetailsCastWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
        builder: (context, state) {
      if (state is MovieCastLoadingState) {
        return const SizedBox(
            height: 250, child: Center(child: CircularProgressIndicator()));
      } else if (state is MovieCastErrorState) {
        return SizedBox(
          height: 250,
          child: Center(
            child: AppErrorWidget(
                errorType: state.errorType,
                handleRetryPress: () {
                  context
                      .read<MovieCastBloc>()
                      .add(LoadMovieCastEvent(movieId: movieId));
                }),
          ),
        );
      } else if (state is MovieCastLoadedState) {
        final castMembers = state.castMembers;
        return CastListView(castMembers: castMembers);
      }
      return const SizedBox.shrink();
    });
  }
}
