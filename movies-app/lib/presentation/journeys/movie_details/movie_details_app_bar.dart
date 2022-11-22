import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsAppBar({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
        BlocBuilder<MoviesFavoriteBloc, MoviesFavoriteState>(
          builder: (context, state) {
            if (state is MoviesFavoriteIsFavoriteOrNotState) {
              print("MoviesFavoriteIsFavoriteOrNotState Here ");
              final bool isFavorite = state.isFavorite;
              return GestureDetector(
                onTap: () {
                  context
                      .read<MoviesFavoriteBloc>()
                      .add(MoviesFavoriteToggleFavoriteEvent(
                        movieTable: MovieTable.fromMovieDetails(movieDetails),
                        isFavorite: state.isFavorite,
                      ));
                },
                child: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
              );
            }
            //TODO: implement other state reponses
            return GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            );
          },
        ),
      ],
    );
  }
}
