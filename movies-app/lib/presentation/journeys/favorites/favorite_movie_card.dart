import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';

class FavoriteMovieCard extends StatelessWidget {
  final MovieTable movie;
  const FavoriteMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: ApiConstants.getPosterPath(movie.posterPath!),
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                context
                    .read<MoviesFavoriteBloc>()
                    .add(MoviesFavoriteDeleteMovieEvent(movieId: movie.id!));
              },
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 20, spreadRadius: 1.5)
                ]),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
