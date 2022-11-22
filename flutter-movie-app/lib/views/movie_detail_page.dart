import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/widgets/movie_detail_widget.dart';
import 'package:movie_app/widgets/reload_state_button.dart';

class MovieDetailPage extends StatefulWidget {
  final movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  _loadMovie() async {
    context.read<MovieDetailCubit>().getMovieDetail(id: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight;

        return BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is InitialState || state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(
                child:
                    ReloadStateButton(size: maxWidth, onPressed: _loadMovie),
              );
            } else if (state is SuccessState) {
              final movie = state.movie;

              return MovieDetailsWidget(
                  maxHeight: maxHeight, movie: movie, maxWidth: maxWidth);
            }
            return const Center();
          },
        );
      }),
    );
  }
}
