import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_backdrop/movies_backdrop_bloc.dart';

class MovieTitleWidget extends StatelessWidget {
  const MovieTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBackdropBloc, MoviesBackdropState>(
      builder: ((context, state) {
        if (state is MoviesBackdropLoadedState) {
          return Text(
            state.movie.title!,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
