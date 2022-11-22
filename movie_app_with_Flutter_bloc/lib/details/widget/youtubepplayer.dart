import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final YoutubePlayerController? videoController;
  final String videopath;
  const YoutubePlayerWidget(
      {super.key, this.videoController, required this.videopath});

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: widget.videopath,
  //   flags: YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: widget.videoController!,
      aspectRatio: 16 / 9,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }
}
