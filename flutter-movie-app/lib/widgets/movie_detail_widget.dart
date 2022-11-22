import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/utils/constants.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    Key? key,
    required this.maxHeight,
    required this.movie,
    required this.maxWidth,
  }) : super(key: key);

  final double maxHeight;
  final MovieDetailModel movie;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: maxWidth < 600
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              width: double.infinity,
              height: maxHeight / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    Constants.urlImagePoster + movie.backdropPath,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'Overview',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
              child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(movie.overview,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
