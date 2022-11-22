import 'package:flutter/material.dart';
import 'package:movies_app_with_bloc/details/widget/youtubepplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    double kDefaultPadding = 20.0;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          // YoutubePlayerWidget(controller: controller),
          // const CategoryList(),
          // Genres(),
          SizedBox(
            height: kDefaultPadding,
          ),
          const MovieCarousel(),
        ],
      ),
    );
  }
}
