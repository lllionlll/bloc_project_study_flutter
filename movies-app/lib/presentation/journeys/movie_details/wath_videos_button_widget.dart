import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/domain/entities/watch_videos_arguments.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';
import 'package:movies_app/presentation/journeys/watch_videos/watch_videos_screen.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';
import 'package:movies_app/presentation/widgets/button_widget.dart';

class WatchVideosButtonWidget extends StatelessWidget {
  final int movieId;
  const WatchVideosButtonWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideosBloc, MovieVideosState>(
      builder: (context, state) {
        if (state is MovieVideosLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieVideosErrorState) {
          return AppErrorWidget(
            errorType: state.errorType,
            handleRetryPress: () {
              context
                  .read<MovieVideosBloc>()
                  .add(LoadMovieVideosEvent(movieId: movieId));
            },
          );
        } else if (state is MovieVideosLoadedState &&
            state.movieVideos.iterator.moveNext()) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ButtonWidget(
              handlePress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => WatchVideosScreen(
                        watchVideosArguments:
                            WatchVideosArguments(videos: state.movieVideos))));
              },
              text: LanguageConstansts.watchVideos,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
