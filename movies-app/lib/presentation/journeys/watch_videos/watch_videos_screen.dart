import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/watch_videos_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideosScreen extends StatefulWidget {
  final WatchVideosArguments watchVideosArguments;
  const WatchVideosScreen({super.key, required this.watchVideosArguments});

  @override
  State<WatchVideosScreen> createState() => _WatchVideosScreenState();
}

class _WatchVideosScreenState extends State<WatchVideosScreen> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.watchVideosArguments.videos[0].key!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstansts.watchTraillers.translate(context),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _youtubePlayerController,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.redAccent,
              handleColor: Colors.red,
            ),
          ),
          builder: (ctx, player) {
            return Column(
              children: [
                player,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < widget.watchVideosArguments.videos.length;
                            i++)
                          Container(
                            //color: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            height: 100,
                            child: GestureDetector(
                              onTap: () {
                                _youtubePlayerController.load(
                                    widget.watchVideosArguments.videos[i].key!);
                                _youtubePlayerController.play();
                              },
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: YoutubePlayer.getThumbnail(
                                        videoId: widget.watchVideosArguments
                                            .videos[i].key!),
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Text(
                                        widget.watchVideosArguments.videos[i]
                                            .name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
