import 'package:flutter/material.dart';

import 'package:movies_app_with_bloc/details/title_duration_and_fav_btn.dart';
import 'package:movies_app_with_bloc/models/movie.dart';
import 'backdrop_rating.dart';
import 'cast_and_crew.dart';
import 'genres.dart';

class BodyDetails extends StatelessWidget {
  final Result movie;
  const BodyDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 20.0;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackdropAndRating(
              size: size, movie: movie, kDefaultPadding: kDefaultPadding),
          SizedBox(
            height: kDefaultPadding / 5,
          ),

          ///title#################
          ///
          TitleDurationAndFavBtn(
              kDefaultPadding: kDefaultPadding, movie: movie),
          Genress(
            kDefaultPadding: kDefaultPadding,
            movie: movie,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            child: Text(
              'Plot Summary',
              style: TextStyle(fontSize: 25, color: Colors.grey[700]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              movie.overview.toString(),
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          CastAndCrew(
            movieId: movie.id.toString(),
          ),
        ],
      ),
    );
  }
}
